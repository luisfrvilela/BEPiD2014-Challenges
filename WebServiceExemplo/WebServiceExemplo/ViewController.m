//
//  ViewController.m
//  WebServiceExemplo
//
//  Created by Luís Resende on 22/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)enviar:(id)sender {
    
    if ([self.usuario.text isEqual:@"luis"]==YES && [self.senha.text isEqual:@"luis"]==YES) {
        [self performSegueWithIdentifier:@"login_sucesso" sender:self];
    }
    else{
        if ([self.usuario.text isEqual:@""]==YES || [self.senha.text isEqual:@""]==YES) {
            [self erroLoginEmBranco];
        }
        else{
            [self erroLoginErrado];
        }
    }
}

-(void)erroLoginEmBranco{
    
    UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Usario e/ou senha em branco" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
 
    [a show];
}

-(void)erroLoginErrado{
    
    UIAlertView *a = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Usario e/ou senha incorretos" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    
    [a show];
}
@end
