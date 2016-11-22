//
//  DetailViewController.m
//  two
//
//  Created by Lixin on 16/11/14.
//  Copyright © 2016年 lixin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail it
    Product *theproduct = (Product *) self.detailItem;
    self.namelabel.text = theproduct.name;
    self.manufacturelabel.text = theproduct.manufacture;
    self.detailslabel.text = theproduct.details;
    self.detailslabel.text = theproduct.details;
    self.pricelabel.text = [NSString stringWithFormat:@"%.2f",theproduct.price];
    self.quantitylabel.text = [NSString stringWithFormat:@"%d",theproduct.quantity];
    self.countrylabel.text = theproduct.countryforgin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}
- (IBAction)comback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
