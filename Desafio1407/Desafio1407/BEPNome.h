//
//  BEPNome.h
//  Desafio1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPNome : NSObject

@property (nonatomic) NSString *nome;
@property int idade;
@property float altura;
@property float peso;

+(id)sharedNome;
-(id)obterSharedNome;
-(void)setarSharedNome: (NSString *) nome;

-(int)obterSharedIdade;
-(void)setarSharedIdade: (int) idade;

-(float)obterSharedAltura;
-(void)setarSharedAltura: (float) altura;

-(float)obterSharedPeso;
-(void)setarSharedPeso: (float) peso;


@end
