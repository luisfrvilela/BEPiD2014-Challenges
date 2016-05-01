//
//  SecondViewController.m
//  Desafio1007
//
//  Created by Luís Resende on 11/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    _nomeCompleto.text = _nome;
    UIImage *image = [UIImage imageNamed:_nomeImagem];
    _imagem.image = image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
