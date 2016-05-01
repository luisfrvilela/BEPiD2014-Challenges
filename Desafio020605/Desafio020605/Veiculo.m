//
//  Veiculo.m
//  Desafio020605
//
//  Created by ALS on 06/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Veiculo.h"

@implementation Veiculo

-(float)andar{
    return ([_locomocaoVeiculo facilidade] * [_potenciaVeiculo forca]);
}

-(void)setLocomocaoVeiculo:(id<locomocao>)locomocaoVeiculo{
    _locomocaoVeiculo = locomocaoVeiculo;
}

@end
