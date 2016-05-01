//
//  PrincipalViewController.m
//  App011405
//
//  Created by Luís Resende on 14/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "PrincipalViewController.h"
#import "CadastroViewController.h"
#import "Pessoa.h"
@interface PrincipalViewController ()

@end

@implementation PrincipalViewController
- (IBAction)enviarDados:(UIButton *)sender {
    
    if(! _lista){
        _lista = [[NSMutableArray alloc]init];
    }
    
    NSMutableDictionary *dados = [[NSMutableDictionary alloc]init];
    
    [dados setObject:self.nome.text forKey:@"nome"];
    [dados setObject:self.idade.text forKey:@"idade"];
    [dados setObject:self.email.text forKey:@"email"];
    [dados setObject:self.telefone.text forKey:@"telefone"];
    [dados setObject:self.universidade.text forKey:@"universidade"];
    [dados setObject:self.curso.text forKey:@"curso"];
    
    [_lista addObject:dados];
   
    CadastroViewController *cadastro = [[CadastroViewController alloc]init];

    [self presentViewController:cadastro animated:NO
                     completion:nil];
    
}


- (void) gravarDados{

        [_lista writeToFile:@"/tmp/usuarios.plist" atomically:YES];
    
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.nome resignFirstResponder];
    [self.email resignFirstResponder];
    [self.telefone resignFirstResponder];
    [self.universidade resignFirstResponder];
    [self.curso resignFirstResponder];
}

- (IBAction)mexeuSlider:(id)sender
{
    [self.idade setText:[NSString stringWithFormat:@"%d" , (int)((UISlider *)sender).value]];
}

- (IBAction)limparCampos:(UIButton *)sender {
    
    [self.nome setText:@""];
    [self.idade setText:@"sua idade"];
    [self.email setText:@""];
    [self.telefone setText:@""];
    [self.universidade setText:@""];
    [self.curso setText:@""];
}

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

@end
