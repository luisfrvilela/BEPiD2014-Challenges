//
//  PAATableViewController.m
//  splitViewController
//
//  Created by Luís Resende on 16/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "PAATableViewController.h"
#import "PAAItemStore.h"
#import "PAAItem.h"
#import "PAADetailViewController.h"

@interface PAATableViewController ()

@end

@implementation PAATableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
               
        PAAItemStore *store = [PAAItemStore sharedStore];
        PAAItem *item = [[PAAItem alloc]init];
       
        item = [store createItem];
        item = [store createItem];
        item = [store createItem];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addObjeto)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}
-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addObjeto{
    
    [self.tableView reloadData];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    }
    PAAItem *i = [PAAItemStore sharedStore].allItems[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, R$ %d", i.itemName, i.value];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PAAItem *item = [[PAAItemStore sharedStore]allItems][indexPath.row];
    
    _detailViewController.item = item;
    UINavigationController *detail = [[UINavigationController alloc]initWithRootViewController:_detailViewController];
    
    self.splitViewController.viewControllers = @[[self.splitViewController.viewControllers firstObject], detail];
    
    if(!self.splitViewController){
        [self.navigationController pushViewController:_detailViewController animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        //remove dado do nsmutable array
        //[[[PAAItemStore sharedStore]allItems] removeObjectAtIndex:indexPath.row];
        
        //remove dado da tableview
       // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
