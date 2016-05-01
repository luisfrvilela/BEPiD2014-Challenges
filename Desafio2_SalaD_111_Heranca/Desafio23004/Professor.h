//
//  Professor.h
//  Desafio23004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pessoa.h"
@class Aluno;
@interface Professor : Pessoa
@property(nonatomic) NSMutableArray *listaDeAlunos;
@end
