//
//  Endereco.h
//  aula7.3
//
//  Created by Cayke on 29/04/14.
//  Copyright (c) 2014 Cayke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Endereco : NSObject

@property (nonatomic) NSString * CEP;
@property (nonatomic) NSString * logradouro;
@property (nonatomic) NSString * logradouro_nome;
@property (nonatomic) NSString * logradouro_completo;
@property (nonatomic) NSString * bairro;
@property (nonatomic) NSString * cidade;
@property (nonatomic) NSString * uf_sigla;
@property (nonatomic) NSString * uf_nome;

- (instancetype)initWithCep: (NSString *) cep;


@end
