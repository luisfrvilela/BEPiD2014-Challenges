//
//  Professor.m
//  Desafio23004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Professor.h"

@implementation Professor
- (void)dealloc
{
    NSLog(@"Professor: %@ esta saindo da memoria",[_listaDeAlunos description]);
}
- (NSString*) description{
    return [NSString stringWithFormat:@"Alunos: %@",[_listaDeAlunos description]];
}
@end
