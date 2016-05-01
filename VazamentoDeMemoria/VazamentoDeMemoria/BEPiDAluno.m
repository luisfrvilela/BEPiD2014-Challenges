//
//  BEPiDAluno.m
//  VazamentoDeMemoria
//
//  Created by ALS on 02/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "BEPiDAluno.h"
#import "BEPiDPatrimonio.h"

@implementation BEPiDAluno
{
    NSMutableArray *_patrimonio;
}
-(void)setPatrimonio: (NSArray *)p
{
    _patrimonio = [p mutableCopy];
}

-(NSArray *)patrimonio
{
    return [_patrimonio copy];
}

-(void)adicionarPatrimonio:(BEPiDPatrimonio *)p
{
    if(!_patrimonio){
        _patrimonio = [[NSMutableArray alloc]init];
    }
    [_patrimonio addObject:p];
    p.portador = self;
}

-(unsigned int)totalPatrimonio
{
    unsigned int soma = 0;
    for(BEPiDPatrimonio *p in _patrimonio){
        soma += [p valorRevenda];
    }
    return soma;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"Aluno %u possui %u em patrimonio", self.matriculaAluno, self.totalPatrimonio];
}

-(void)dealloc
{
    NSLog(@"Desalocando %@",self);
}


@end
