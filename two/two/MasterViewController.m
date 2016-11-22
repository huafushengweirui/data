//
//  MasterViewController.m
//  two
//
//  Created by Lixin on 16/11/14.
//  Copyright © 2016年 lixin. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Dbaccess *dbaccess = [[Dbaccess alloc]init];
    self.products = [dbaccess getAllproducts];
    [dbaccess closeDatabase];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

//- (void)viewWillAppear:(BOOL)animated {
//    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
//    [super viewWillAppear:animated];
//}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifire = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifire];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifire];
        Product *product = [self.products objectAtIndex:indexPath.row];
        cell.textLabel.text = product.name;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.detailViewController.detailItem = [self.products objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}
@end
