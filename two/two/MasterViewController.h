//
//  MasterViewController.h
//  two
//
//  Created by Lixin on 16/11/14.
//  Copyright © 2016年 lixin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "Dbaccess.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property(strong,nonatomic)NSMutableArray *products;
@end

