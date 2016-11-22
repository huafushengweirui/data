//
//  Dbaccess.h
//  two
//
//  Created by Lixin on 16/11/14.
//  Copyright © 2016年 lixin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import <sqlite3.h>
@interface Dbaccess : NSObject
- (void)initializeDatebase;
-(void)closeDatabase;
-(NSMutableArray *)getAllproducts;
@end
