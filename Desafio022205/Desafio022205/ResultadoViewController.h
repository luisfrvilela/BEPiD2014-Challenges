//
//  ResultadoViewController.h
//  Desafio022205
//
//  Created by Luís Resende on 23/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultadoViewController : UIViewController

@property (nonatomic) IBOutlet UILabel *numeroJogado;
@property (nonatomic) IBOutlet UILabel *numeroApp;
@property (nonatomic) IBOutlet UILabel *resultadoDoJogo;

@property (strong, nonatomic) NSString *strNumeroJogado;
@property (strong, nonatomic) NSString *strNumeroApp;
@property (strong, nonatomic) NSString *strResultadoDoJogo;

@end
