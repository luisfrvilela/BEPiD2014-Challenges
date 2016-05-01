//
//  CarTableViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/29/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "CarTableViewController.h"
#import "CarViewController.h"
#import "CarModel.h"

#error Importar o Car.h

@interface CarTableViewController ()

@end

@implementation CarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.title = @"Carros";
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#error Retornar o número de carros não vendidos cadastrados
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#error Retornar uma UITableViewCell preenchida com os dados do carro.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
#error Push na classe CarViewController na navigationController com o carro selecionado.
}

- (void)createItem
{
    CarViewController *cvc = [[CarViewController alloc] init];
    
    [self.navigationController pushViewController:cvc animated:YES];
}

@end
