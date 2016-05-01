//
//  FirstViewController.h
//  Desafio1007
//
//  Created by Luís Resende on 10/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic) NSMutableDictionary *contatoDicionario;

@property (nonatomic) NSMutableArray *contatosArray;

@end
