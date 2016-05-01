//
//  Aluno.m
//  Desafio23004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Aluno.h"

@implementation Aluno

- (void)dealloc
{
    NSLog(@"Aluno: Matricula %@ esta saindo da memoria",_matricula);
    
}
- (NSString*) description{
    return [NSString stringWithFormat: @"Nome: %@, Sexo %@, Matricula %@",[self nome],[self sexo],_matricula];
}
@end
