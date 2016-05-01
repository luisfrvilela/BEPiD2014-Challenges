//
//  BEPiDUsuario.m
//  Desafio12904
//
//  Created by ALS on 29/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "BEPiDUsuario.h"

@implementation BEPiDUsuario


-(void)setSenha:(NSString *)senha
{
    senha = self.senha;
    
    }
-(void)setDataCriacao
{
    NSDate *dataAtual = [NSDate date];
    dataCriacao = dataAtual;
}
-(NSDate *)dataCriacao
{
    return dataCriacao;
}



@end
