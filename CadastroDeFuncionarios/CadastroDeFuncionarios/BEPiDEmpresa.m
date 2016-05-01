//
//  BEPiDEmpresa.m
//  CadastroDeFuncionarios
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "BEPiDEmpresa.h"

@implementation BEPiDEmpresa

-(id)init{
    self = [super init];
    _funcionarios = [[NSMutableArray alloc] init];
    return self;
}

-(NSArray *)funcionarios
{
    NSArray *ret = [[NSArray alloc]initWithArray:_funcionarios];
    return ret;
}
-(void)setFuncionarios:(BEPiDFuncionario *)novo_funcionario
{
    [_funcionarios addObject:novo_funcionario];
}
-(NSString *)description
{
    return _funcionarios.description;
}

@end
