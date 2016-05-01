//
//  SegundaViewController.h
//  Desafio2_1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>
int i;
@interface SegundaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *campoNome;
@property (weak, nonatomic) IBOutlet UILabel *campoModelo;
@property (weak, nonatomic) IBOutlet UILabel *campoPlaca;
@property (weak, nonatomic) IBOutlet UILabel *campoValor;
@property (weak, nonatomic) IBOutlet UILabel *campoStatus;
@property (weak, nonatomic) IBOutlet UILabel *campoDataInicio;
@property (weak, nonatomic) IBOutlet UILabel *campoDataFim;
@property (weak, nonatomic) IBOutlet UILabel *campoAlugado;
@property (weak, nonatomic) IBOutlet UILabel *campoDisponivel;

@property (nonatomic) NSDictionary *carroDicionario;

@property (weak, nonatomic) IBOutlet UIButton *botao1;
@property (weak, nonatomic) IBOutlet UIButton *botao2;
@property (weak, nonatomic) IBOutlet UIButton *botao3;

@property (weak, nonatomic) UIView *viewTemporaria;

- (instancetype)init:(int)j;



@end
