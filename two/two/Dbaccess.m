//
//  Dbaccess.m
//  two
//
//  Created by Lixin on 16/11/14.
//  Copyright © 2016年 lixin. All rights reserved.
//

#import "Dbaccess.h"

@implementation Dbaccess
sqlite3 *database;
-(id)init{
    if (self = [super init]) {
        [self initializeDatebase];
    }
    return self;
}
-(void)initializeDatebase{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"catalog" ofType:@"db"];
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        NSLog(@"opening database");
    }else{
        
        sqlite3_close(database);
        NSAssert1(0, @"faildd to open database:'%s'.", sqlite3_errmsg(database));
    }
}
-(void)closeDatabase{
    if (sqlite3_close(database) != SQLITE_OK) {
        NSAssert1(0, @"error:faild to close database:'%s'.", sqlite3_errmsg(database));
    }
}
-(NSMutableArray *)getAllproducts{
    NSMutableArray *products = [[NSMutableArray alloc]init];
    const char *sql = "SELECT product.ID,product.Name,\
    Manufacture.name,product.details,product.Price,\
    product.Quantityonhand,country.country, \
    product.Image FROM Product,Manufacture, \
    Country where manufacture.manufactureID = product.manufactureID \
    and product.countryforginID = country.countryid";
    sqlite3_stmt *statement;
    int sqlresult = sqlite3_prepare_v2(database, sql, -1, &statement, nil);
    if (sqlresult == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            Product *product = [[Product alloc]init];
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *manufacture = (char *)sqlite3_column_text(statement, 2);
            char *details = (char *)sqlite3_column_text(statement, 3);
            char *countryforgin = (char *)sqlite3_column_text(statement, 6);
            char *image = (char *)sqlite3_column_text(statement, 7);
            product.ID = sqlite3_column_int(statement, 0);
            product.name = (name) ? [NSString stringWithUTF8String:name]:@"";
            product.manufacture = (manufacture) ? [NSString stringWithUTF8String:manufacture] : @"";
            product.details = (details) ? [NSString stringWithUTF8String:details] : @"";
            product.countryforgin = (countryforgin) ? [NSString stringWithUTF8String:countryforgin] : @"";
            product.image = (image) ? [NSString stringWithUTF8String:image] : @"";
            product.price = sqlite3_column_double(statement, 4);
            product.quantity = sqlite3_column_int(statement, 5);
            [products addObject:product];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"problem with the database:");
        NSLog(@"%d",sqlresult);
    }
    return products;
}

@end
