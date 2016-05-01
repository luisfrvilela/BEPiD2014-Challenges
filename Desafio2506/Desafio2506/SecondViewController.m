//
//  SecondViewController.m
//  Desafio2506
//
//  Created by Luís Resende on 25/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "SecondViewController.h"
#import "VIew2.h"

@implementation SecondViewController

- (void) loadView{
    
    //Criar a view
    VIew2 *firstView = [[VIew2 alloc]init];
    firstView.backgroundColor = [UIColor blueColor];
    _qntTabsAdicionadas=0;
    //Setar com "a view" dessa view controller
    self.view = firstView;
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"View2";
        UIImage *i = [UIImage imageNamed:@"fig1.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    _qntTabsAdicionadas=0;
    [self.tabBarItem setBadgeValue:NO];
    _adicionarTab = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 200, 50)];
    _adicionarTab.backgroundColor = [UIColor redColor];
    _adicionarTab.titleLabel.textColor = [UIColor whiteColor];
    
    [_adicionarTab setTitle:@"Adicionar Tab" forState:UIControlStateNormal];
    [_adicionarTab addTarget:self action:@selector(novaTab) forControlEvents:UIControlEventTouchUpInside];
    [[super view]addSubview:_adicionarTab];
}

-(void)novaTab
{
    _qntTabsAdicionadas++;
    [_adicionarTab setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    
    UIViewController *nova = [[UIViewController alloc]init];
    nova.tabBarItem.title = @"Nova Tab";
    UIImage *i = [UIImage imageNamed:@"fig1.png"];
    nova.tabBarItem.image = i;
    
    NSMutableArray *tabs = [[NSMutableArray alloc]initWithArray:self.tabBarController.viewControllers];
    [tabs addObject:nova];
    
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d",_qntTabsAdicionadas]];
    self.tabBarController.viewControllers = tabs;
}

@end
