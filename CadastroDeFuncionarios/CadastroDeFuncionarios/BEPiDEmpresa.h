//
//  BEPiDEmpresa.h
//  CadastroDeFuncionarios
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDFuncionario.h"
@interface BEPiDEmpresa : NSObject
{
    NSMutableArray *_funcionarios;
}

-(NSArray *)funcionarios;
-(void)setFuncionarios:(BEPiDFuncionario *)novo_funcionario;


@end
