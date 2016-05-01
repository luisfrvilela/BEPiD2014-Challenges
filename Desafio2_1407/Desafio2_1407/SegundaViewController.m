//
//  SegundaViewController.m
//  Desafio2_1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "SegundaViewController.h"
#import "Carro.h"
#import "PrimeiraViewController.h"
#import "AlugarViewController.h"

@interface SegundaViewController ()

@end

@implementation SegundaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)init:(int)j
{
    self = [super init];
    if (self) {
        
    }
    i = j;
    self.viewTemporaria = self.view;
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewDidLoad];
    
    [self.view removeFromSuperview];
    
    self.view = [[UIView alloc]init];
    
    [self.view addSubview:self.viewTemporaria];
    
    self.carroDicionario = [[Carro sharedCarros] obterSharedCarros][i];
    
    self.campoNome.text = self.carroDicionario[@"nome"];
    
    self.campoModelo.text = self.carroDicionario[@"modelo"];
    
    self.campoPlaca.text = self.carroDicionario[@"placa"];
    
    self.campoValor.text = self.carroDicionario[@"valor"];
    
    self.campoDataInicio.text = [[NSString alloc]initWithFormat:@"%@",self.carroDicionario[@"dataInicio"]];
    
    self.campoDataFim.text = [[NSString alloc]initWithFormat:@"%@",self.carroDicionario[@"dataFim"]];
    
    self.campoStatus.text = self.carroDicionario[@"status"];
    
    if([self.campoStatus.text isEqualToString:@"Disponível"]){
        self.campoDisponivel.text = [[NSString alloc]initWithFormat:@"Dias disponíveis: %.0f",ABS([self.carroDicionario[@"dataFim"] timeIntervalSinceNow]/86400)];
        
        [self.campoAlugado setHidden:YES];
        [self.botao1 setHidden:YES];
    }
    if([self.campoStatus.text isEqualToString:@"Alugado"]){
        self.campoAlugado.text = [[NSString alloc]initWithFormat:@"Dias alugados: %.0f",ABS([self.carroDicionario[@"dataInicio"] timeIntervalSinceNow]/86400)];
        
        [self.campoDisponivel setHidden:YES];
        [self.botao2 setHidden:YES];
    }
    if ([self.campoStatus.text isEqualToString:@"Oficina"]) {
        
        [self.campoDisponivel setHidden:YES];
        [self.campoAlugado setHidden:YES];
        [self.botao2 setHidden:YES];
        [self.botao3 setHidden:YES];
    }
    
    [self.view addSubview:self.botao1];
    [self.view addSubview:self.botao2];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)botaoOficina:(id)sender{
    [self.carroDicionario setValue:@"Oficina" forKey:@"status"];
    
    [[Carro sharedCarros]setarSharedCarros:self.carroDicionario:i];
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)botaoRetorno:(id)sender{
    [self.carroDicionario setValue:@"Disponível" forKey:@"status"];
   
    [self.carroDicionario setValue:[NSDate date] forKey:@"dataFim"];
    
    [[Carro sharedCarros]setarSharedCarros:self.carroDicionario:i];
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)botaoAlugar:(id)sender{
    [[Carro sharedCarros]setarSharedCarros:self.carroDicionario:i];
    
    AlugarViewController *alugar = [[AlugarViewController alloc]init:i];
    
    [self.navigationController pushViewController:alugar animated:YES];
}
@end
