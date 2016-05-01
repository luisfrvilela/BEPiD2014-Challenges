//
//  MJRPrincipalViewController.h
//  TableView-Completo
//
//  Created by Luís Resende on 09/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJRPrincipalViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (strong, nonatomic) NSMutableArray *numbers;

@property (strong, nonatomic) NSMutableArray *imagens;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPat;

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

@end
