//
//  BEPRoda.m
//  DesafioRevisao3004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "BEPRoda.h"

@implementation BEPRoda

-(NSString *) description
{
    return [NSString stringWithFormat:@"Aro: %d, Largura: %d, Perfil: %d, Material: %@", _aro, _largura, _perfil, _material];
}

@end
