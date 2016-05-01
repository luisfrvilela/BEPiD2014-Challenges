//
//  ViewController.m
//  desafio2507
//
//  Created by Luís Resende on 28/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self trocouFonte];
	
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    
    [notification addObserver:self selector:@selector(trocouFonte) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)trocouFonte{
    
    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    
    self.tipoTexto.font = font;
}

-(void)dealloc{
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    
    [notification removeObserver:self];
}

- (IBAction)botao1:(id)sender {
    self.tipoTexto.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

- (IBAction)botao2:(id)sender {
    self.tipoTexto.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
}

- (IBAction)botao3:(id)sender {
    self.tipoTexto.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (IBAction)botao4:(id)sender {
    self.tipoTexto.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
}

- (IBAction)botao5:(id)sender {
    self.tipoTexto.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

- (IBAction)botao6:(id)sender {
    self.tipoTexto.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
}
@end