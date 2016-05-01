//
//  ResultadoViewController.h
//  Desafio022205
//
//  Created by Luís Resende on 23/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultadoViewController : UIViewController

@property (nonatomic) IBOutlet UIImageView *numeroJogado;
@property (nonatomic) IBOutlet UIImageView *numeroApp;
@property (nonatomic) IBOutlet UILabel *resultadoDoJogo;

@property (nonatomic) UIImage *imagemNumeroJogado;
@property (nonatomic) UIImage *imagemNumeroApp;
@property (strong, nonatomic) NSString *strResultadoDoJogo;

@end
