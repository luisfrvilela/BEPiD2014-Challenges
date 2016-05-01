//
//  BEPiDPessoa.h
//  Aula
//
//  Created by Phelippe Augusto de Amorim on 3/14/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(char, BEPiDSexo)
{
    Masculino,
    Feminino
};

@interface BEPiDPessoa : NSObject

@property NSDate *dataNascimento;
@property NSString *nome;
@property NSString *sobreNome;
@property BEPiDSexo sexo;

- (NSString *)nomeCompleto;
- (int)idade;

@end




