//
//  ViewController.m
//  desafio2310
//
//  Created by Rodrigo Von-Grapp Freitas on 23/10/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import "ViewController.h"
#import "ImageTableViewCell.h"
#import "ImageCollectionViewCell.h"

@interface ViewController ()

@property NSArray *carros;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.carros == nil){
        [self initData];
    }
    return [self.carros count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    ImageTableViewCell *customCell = (ImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(customCell == nil){
        customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    }
    
    UIImageView *image = (UIImageView *)[customCell viewWithTag:1];
    image.image = [UIImage imageNamed:self.carros[indexPath.row]];
    
    return customCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.carros == nil){
        [self initData];
    }
    return [self.carros count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CollectionCell";
    
    ImageCollectionViewCell *customCell = (ImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(customCell == nil){
        customCell = [[ImageCollectionViewCell alloc]init];
    }
    
    customCell.image.image = [UIImage imageNamed:self.carros[indexPath.row]];
    
    return customCell;
}

-(void)initData{
    self.carros = @[@"carro1",@"carro2",@"carro3",@"carro4",@"carro5",@"carro6",@"carro7",@"carro8"];
}

@end
