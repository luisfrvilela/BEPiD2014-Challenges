//
//  SecondViewController.h
//  Desafio1007
//
//  Created by Luís Resende on 11/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nomeCompleto;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;

@property (nonatomic) NSString *nome;

@property (nonatomic) NSString *nomeImagem;

@end
