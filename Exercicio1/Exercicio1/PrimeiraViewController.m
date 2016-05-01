//
//  PrimeiraViewController.m
//  Exercicio1
//
//  Created by Teste on 28/03/14.
//  Copyright (c) 2014 Exercicio1. All rights reserved.
//

#import "PrimeiraViewController.h"

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
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == primeiroNome){
        [sobreNome becomeFirstResponder];
        return YES;
    }else if(textField == sobreNome){
        [self buttonAction:textField];
        return YES;
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [primeiroNome resignFirstResponder];
    [sobreNome resignFirstResponder];
}
- (IBAction)buttonAction:(id)sender{
    NSLog(@"The button work correctly!");
    if([primeiroNome.text isEqualToString:@""] | [sobreNome.text isEqualToString:@""]){
        UIAlertView *alertaVazio = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Digite todos os campos" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertaVazio show];
        return;
    }
    NSString *mensagem = @"Olá mundo ";
    mensagem = [mensagem stringByAppendingString: primeiroNome.text];
    mensagem = [mensagem stringByAppendingString:@" "];
    
    mensagem = [mensagem stringByAppendingString:sobreNome.text];
    
    labelModify.text = mensagem;
    [super viewDidLoad];
    
    primeiroNome.delegate = self;
    sobreNome.deleg	ate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
