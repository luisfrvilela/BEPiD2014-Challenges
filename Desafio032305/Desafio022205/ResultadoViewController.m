//
//  ResultadoViewController.m
//  Desafio022205
//
//  Created by Luís Resende on 23/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "ResultadoViewController.h"

@interface ResultadoViewController ()

@end

@implementation ResultadoViewController

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
    self.resultadoDoJogo.text = _strResultadoDoJogo;
    self.numeroApp.image = _imagemNumeroApp;
    self.numeroJogado.image = _imagemNumeroJogado;
    
    if([_strResultadoDoJogo isEqualToString:@"Ganhou"]){
        self.resultadoDoJogo.textColor = [UIColor greenColor];
    }
    else{
       self.resultadoDoJogo.textColor = [UIColor redColor];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}*/

@end
