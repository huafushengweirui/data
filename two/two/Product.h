//
//  product.h
//  two
//
//  Created by Lixin on 16/11/14.
//  Copyright © 2016年 lixin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property(nonatomic)int ID;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *manufacture;
@property(nonatomic,copy)NSString *details;
@property(nonatomic)float price;
@property(nonatomic)int quantity;
@property(nonatomic,copy)NSString *countryforgin;
@property(nonatomic,copy)NSString *image;
@end
