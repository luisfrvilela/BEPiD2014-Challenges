//
//  BEPiDFuncionario.m
//  CadastroDeFuncionarios
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "BEPiDFuncionario.h"

@implementation BEPiDFuncionario

-(int)id
{
    return _id;
}
-(void)setId:(int)idFunc
{
    _id = idFunc;
}

-(float)salario
{
    return _salario;
}
-(void)setSalario:(float)salFunc
{
    _salario = salFunc;
}

-(NSString *)nome
{
    return _nome;
}
-(void)setNome:(NSString *)nomeFunc
{
    _nome = nomeFunc;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"id: %d, Nome: %@, Salario: %.2f", [self id], [self nome], [self salario]];
}

@end
