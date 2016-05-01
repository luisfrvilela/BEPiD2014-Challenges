//
//  BrandTableViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/29/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "BrandTableViewController.h"
#import "BrandViewController.h"
#import "BrandModel.h"
#import "Brand.h"

@interface BrandTableViewController ()

@end

@implementation BrandTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.title = @"Marcas";
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#error Retornar o número de marcas cadastrados
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#error Retornar uma UITableViewCell preenchida com os dados da marca.
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
#error Push na classe BrandViewController na navigationController com a marca selecionada.
}

- (void)createItem
{
    BrandViewController *bvc = [[BrandViewController alloc] init];
    
    [self.navigationController pushViewController:bvc animated:YES];
}

@end
