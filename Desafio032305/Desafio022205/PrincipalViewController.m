//
//  PrincipalViewController.m
//  Desafio022205
//
//  Created by Luís Resende on 22/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "PrincipalViewController.h"
#import "ResultadoViewController.h"

@interface PrincipalViewController ()

@end

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

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)jogar:(UIButton *)sender {
    
    int aleatorio = arc4random() % 6;
    int soma = 0;
    int numeroUsuario=0;
    
    //Recebendo o numero do usuario
    if(_numero.selectedSegmentIndex == 0){numeroUsuario = 0;}
    if(_numero.selectedSegmentIndex == 1){numeroUsuario = 1;}
    if(_numero.selectedSegmentIndex == 2){numeroUsuario = 2;}
    if(_numero.selectedSegmentIndex == 3){numeroUsuario = 3;}
    if(_numero.selectedSegmentIndex == 4){numeroUsuario = 4;}
    if(_numero.selectedSegmentIndex == 5){numeroUsuario = 5;}
   
    ResultadoViewController *resultado = [[ResultadoViewController alloc]init];

        
    //Carregando as imagens
    resultado.imagemNumeroApp = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",aleatorio]];
    resultado.imagemNumeroJogado = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",numeroUsuario]];
    
    //Resultado do jogo
   if(_opcaoNumero.selectedSegmentIndex == 0){
        soma = numeroUsuario + aleatorio;
        if(soma % 2 == 0){
            resultado.strResultadoDoJogo = @"Ganhou";
        }
        else{
            resultado.strResultadoDoJogo = @"Perdeu";
        }
    }
    else{
        soma = numeroUsuario + aleatorio;
        if(soma % 2 == 0){
            resultado.strResultadoDoJogo = @"Perdeu";
        }
        else{
            resultado.strResultadoDoJogo = @"Ganhou";
        }
    }
    
    [self presentViewController:resultado animated:YES completion:nil];
    
}
@end
