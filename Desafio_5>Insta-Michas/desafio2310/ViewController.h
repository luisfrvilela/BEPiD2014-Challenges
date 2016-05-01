//
//  ViewController.h
//  desafio2310
//
//  Created by Rodrigo Von-Grapp Freitas on 23/10/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tabela;
@property (weak, nonatomic) IBOutlet UICollectionView *colecao;

@end

