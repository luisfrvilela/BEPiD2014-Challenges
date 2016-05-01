//
//  Veiculo.h
//  Desafio020605
//
//  Created by ALS on 06/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "locomocao.h"
#import "potencia.h"
@interface Veiculo : NSObject

@property (nonatomic) id <locomocao> locomocaoVeiculo;
@property (nonatomic) id <potencia> potenciaVeiculo;

-(float)andar;

@end
