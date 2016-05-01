//
//  FirstViewController.m
//  Desafio1007
//
//  Created by Luís Resende on 10/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomTableViewCell.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    
    NSString *a = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
    
    _contatosArray = [[NSMutableArray alloc]initWithContentsOfFile:[NSString stringWithFormat:@"%@",a]];
    
    _contatoDicionario = [[NSMutableDictionary alloc]init];
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
    [self.myTableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  12;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIndetifier = @"Cell";
    
    CustomTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier forIndexPath:indexPath];
    
    if(customCell == nil){
        customCell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier forIndexPath:indexPath];
    }
    
    self.contatoDicionario = self.contatosArray[indexPath.row];
    
    NSString *primeiroNome = self.contatoDicionario[@"firstName"];
    NSString *segundoNome = self.contatoDicionario[@"lastName"];
    NSString *imagem = self.contatoDicionario[@"imageName"];
    
    UIImage *image = [UIImage imageNamed:imagem];
    
    customCell.customPrimeiroNome.text = primeiroNome;
    customCell.customSegundoNome.text = segundoNome;
    customCell.customImagem.image = image;
    
    return customCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SecondViewController *second = [[SecondViewController alloc]init];
    
    self.contatoDicionario = self.contatosArray[indexPath.row];
    
    NSString *primeiroNome = self.contatoDicionario[@"firstName"];
    NSString *segundoNome = self.contatoDicionario[@"lastName"];
    NSString *imagem = self.contatoDicionario[@"imageName"];
    
    second.nome = [NSString stringWithFormat:@"%@ %@",primeiroNome, segundoNome];
    second.nomeImagem = imagem;
    
    [self.navigationController pushViewController:second animated:YES];
    
}

@end
