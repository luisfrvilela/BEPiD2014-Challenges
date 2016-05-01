//
//  PrincipalViewController.m
//  Desafio042005
//
//  Created by Luís Resende on 20/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "PrincipalViewController.h"
#import "DesenhoViewController.h"
#import "drawElipse.h"

@interface PrincipalViewController ()

@end

DesenhoViewController *desenhoJapao = nil;
DesenhoViewController *desenhoFranca = nil;
DesenhoViewController *desenhoDinamarca = nil;
DesenhoViewController *desenhoChile = nil;

@implementation PrincipalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)desenharJapao:(id)sender
{
    if(!desenhoJapao){
        desenhoJapao = [[DesenhoViewController alloc]init];
    }
    
    
    CGRect japao = CGRectMake (10, 100, 300, 200);
    UIView * linha = [[UIView alloc]initWithFrame:japao];
    linha.backgroundColor = [UIColor blackColor];
    [desenhoJapao.view addSubview:linha];
    
    japao = CGRectMake(11, 101, 298, 198);
    UIView *retangulo = [[UIView alloc]initWithFrame:japao];
    retangulo.backgroundColor = [UIColor whiteColor];
    [desenhoJapao.view addSubview:retangulo];
    
    japao = CGRectMake(100, 140, 120, 120);
    drawElipse *circuloView = [[drawElipse alloc]initWithFrame:japao];
    circuloView.backgroundColor = [UIColor clearColor];
    
    [desenhoJapao.view addSubview:circuloView];
   
    [self presentViewController:desenhoJapao animated:YES completion:nil];
    
    
}

-(IBAction)desenharFranca:(id)sender
{
    if(!desenhoFranca){
        desenhoFranca = [[DesenhoViewController alloc]init];
    }
    
    CGRect franca = CGRectMake (10, 100, 300, 200);
    UIView * linha = [[UIView alloc]initWithFrame:franca];
    linha.backgroundColor = [UIColor blackColor];
    [desenhoFranca.view addSubview:linha];
    
    franca = CGRectMake(franca.origin.x +1, franca.origin.y+1, 98, 198);
    UIView *retanguloAzul = [[UIView alloc]initWithFrame:franca];
    retanguloAzul.backgroundColor = [UIColor blueColor];
    [desenhoFranca.view addSubview:retanguloAzul];
    
    franca = CGRectMake(franca.origin.x+98,franca.origin.y, 100, 198);
    UIView *retanguloBranco = [[UIView alloc]initWithFrame:franca];
    retanguloBranco.backgroundColor = [UIColor whiteColor];
    [desenhoFranca.view addSubview:retanguloBranco];
    
    franca = CGRectMake(franca.origin.x+100,franca.origin.y, 100, 198);
    UIView *retanguloVermelho = [[UIView alloc]initWithFrame:franca];
    retanguloVermelho.backgroundColor = [UIColor redColor];
    [desenhoFranca.view addSubview:retanguloVermelho];
    
    [self presentViewController:desenhoFranca animated:YES completion:nil];
    
}

-(IBAction)desenharDinamarca:(id)sender
{
    if(!desenhoDinamarca){
        desenhoDinamarca = [[DesenhoViewController alloc]init];
    }
    
    CGRect dinamarca = CGRectMake (10, 100, 300, 200);
    UIView * linha = [[UIView alloc]initWithFrame:dinamarca];
    linha.backgroundColor = [UIColor blackColor];
    [desenhoDinamarca.view addSubview:linha];
    
    dinamarca = CGRectMake(11,101,298,198);
    UIView *parteVermelha = [[UIView alloc]initWithFrame:dinamarca];
    parteVermelha.backgroundColor = [UIColor redColor];
    [desenhoDinamarca.view addSubview:parteVermelha];
    
    dinamarca = CGRectMake(108,101,32,198);
    UIView *cruzBranca = [[UIView alloc]initWithFrame:dinamarca];
    cruzBranca.backgroundColor = [UIColor whiteColor];
    [desenhoDinamarca.view addSubview:cruzBranca];
    
    dinamarca = CGRectMake(11,186,298,32);
    UIView *cruzBranca2 = [[UIView alloc]initWithFrame:dinamarca];
    cruzBranca2.backgroundColor = [UIColor whiteColor];
    [desenhoDinamarca.view addSubview:cruzBranca2];
    
    [self presentViewController:desenhoDinamarca animated:YES completion:nil];
    
}

-(IBAction)desenharChile:(id)sender
{
    if(!desenhoChile){
        desenhoChile = [[DesenhoViewController alloc]init];
    }
    
    CGRect chile = CGRectMake (10, 100, 300, 200);
    UIView * linha = [[UIView alloc]initWithFrame:chile];
    linha.backgroundColor = [UIColor blackColor];
    [desenhoChile.view addSubview:linha];
    
    chile = CGRectMake(11,101,298,100);
    UIView *retanguloBranco = [[UIView alloc]initWithFrame:chile];
    retanguloBranco.backgroundColor = [UIColor whiteColor];
    [desenhoChile.view addSubview:retanguloBranco];
    
    chile = CGRectMake(11,201,298,98);
    UIView *retanguloVermelho = [[UIView alloc]initWithFrame:chile];
    retanguloVermelho.backgroundColor = [UIColor redColor];
    [desenhoChile.view addSubview:retanguloVermelho];
    
    chile = CGRectMake(11,101,100,100);
    UIView *quadradoAzul = [[UIView alloc]initWithFrame:chile];
    quadradoAzul.backgroundColor = [UIColor blueColor];
    [desenhoChile.view addSubview:quadradoAzul];
    
    [self presentViewController:desenhoChile animated:YES completion:nil];
    
}



@end
