//
//  PrimeiraViewController.m
//  Desafio2_1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "PrimeiraViewController.h"
#import "SegundaViewController.h"
#import "Carro.h"

@interface PrimeiraViewController ()

@end

@implementation PrimeiraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Atualizar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizaDados:)];
        
        navItem.rightBarButtonItem = editButton;
    }
    
    return self;
}

-(IBAction)atualizaDados:(id)sender{
    int i = self.scroll.bounds.origin.x/self.scroll.bounds.size.width;
    
    SegundaViewController *atualizaController = [[SegundaViewController alloc]init:i];
    
    [self.navigationController pushViewController:atualizaController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.scroll removeFromSuperview];
    
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 67, 320, 501)];
    
    [self.view addSubview:self.scroll];
    
    [self.scroll setScrollEnabled:YES];
    [self.scroll setContentSize:CGSizeMake(self.scroll.bounds.size.width*[[[Carro sharedCarros] obterSharedCarros] count], self.scroll.bounds.size.height)];
    self.scroll.pagingEnabled = YES;
    
    UILabel *nome, *modelo, *status;
    for(int i = 0; i <[[[Carro sharedCarros] obterSharedCarros] count]; i++){
        self.dados = [[Carro sharedCarros]obterSharedCarros][i];
        
        nome = [[UILabel alloc]initWithFrame:CGRectMake(20+i*self.scroll.bounds.size.width, 0, 80, 30)];
        nome.text = self.dados[@"nome"];
        modelo = [[UILabel alloc]initWithFrame:CGRectMake(20+i*self.scroll.bounds.size.width, 35, 80, 30)];
        modelo.text = self.dados[@"modelo"];
        status = [[UILabel alloc]initWithFrame:CGRectMake(20+i*self.scroll.bounds.size.width, 70, 80, 30)];
        status.text = self.dados[@"status"];
        
        [self.scroll addSubview:nome];
        [self.scroll addSubview:modelo];
        [self.scroll addSubview:status];
        
        if([status.text isEqualToString:@"Disponível"]){
            status.textColor = [UIColor greenColor];
            if(ABS([self.dados[@"dataFim"] timeIntervalSinceNow]/86400)>30){
                status.backgroundColor = [UIColor blueColor];
            }
        }
        if([status.text isEqualToString:@"Alugado"]){
            status.textColor = [UIColor redColor];
            if([self.dados[@"dataFim"] timeIntervalSinceNow]/86400<0){
                status.backgroundColor = [UIColor redColor];
                status.textColor = [UIColor whiteColor];
            }
        }
        if ([status.text isEqualToString:@"Oficina"]) {
            status.textColor = [UIColor orangeColor];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
