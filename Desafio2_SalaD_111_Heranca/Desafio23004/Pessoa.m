//
//  Pessoa.m
//  Desafio23004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Pessoa.h"

@implementation Pessoa

- (void)dealloc
{
    NSLog(@"Pessoa: %@ esta siando da memoria",self);
}
-(NSString*) description{
    return [NSString stringWithFormat:@"Nome: %@ sexo: %@",_nome,_sexo];
}
@end
