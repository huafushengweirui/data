//
//  DetailViewController.h
//  two
//
//  Created by Lixin on 16/11/14.
//  Copyright © 2016年 lixin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *manufacturelabel;
@property (weak, nonatomic) IBOutlet UILabel *detailslabel;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (weak, nonatomic) IBOutlet UILabel *quantitylabel;
@property (weak, nonatomic) IBOutlet UILabel *countrylabel;

@property (strong, nonatomic) id detailItem;

@end

