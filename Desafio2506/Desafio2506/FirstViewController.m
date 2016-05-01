//
//  FirstViewController.m
//  Desafio2506
//
//  Created by Luís Resende on 25/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "FirstViewController.h"
#import "View1.h"

@implementation FirstViewController

- (void) loadView{
    
    //Criar a view
    View1 *firstView = [[View1 alloc]init];
    
    //Setar com "a view" dessa view controller
    self.view = firstView;
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"View1";
        UIImage *i = [UIImage imageNamed:@"fig1.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void) viewDidLoad
{
    
    _adicionarNotificacao = [[UIButton alloc]initWithFrame:CGRectMake(30, 100, 200, 50)];
    _adicionarNotificacao.backgroundColor = [UIColor blueColor];
    _adicionarNotificacao.titleLabel.textColor = [UIColor whiteColor];
    [_adicionarNotificacao setTitle:@"Adicionar Notificacao" forState:UIControlStateNormal];
    [[super view]addSubview:_adicionarNotificacao];
    _quantidadeTabs = [[UILabel alloc]initWithFrame:CGRectMake(30, 50, 200, 50)];
    [_quantidadeTabs setText:[NSString stringWithFormat:@"%d",(int)self.tabBarController.viewControllers.count]];

    [[super view]addSubview:_quantidadeTabs];
}

-(void) viewWillAppear:(BOOL)animated
{
    _qntNotificacao=0;
    
    [self.tabBarItem setBadgeValue:NO];
    
    [_adicionarNotificacao addTarget:self action:@selector(novaNotificacao) forControlEvents:UIControlEventTouchUpInside];
    
    [_quantidadeTabs setText:[NSString stringWithFormat:@"%d",(int)self.tabBarController.viewControllers.count]];
    [[super view]addSubview:_quantidadeTabs];
    
    
}

-(void)novaNotificacao
{
    _qntNotificacao++;
    
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:_qntNotificacao];
    
    UILocalNotification *nota = [[UILocalNotification alloc]init];
    nota.alertBody = @"Alerta do aluno 62";
    nota.soundName = @"notificacao62.caf";
    nota.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:nota];
    
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d",_qntNotificacao]];
}

@end
