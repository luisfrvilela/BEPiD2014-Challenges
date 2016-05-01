//
//  BEPCarro.m
//  DesafioRevisao3004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "BEPCarro.h"

@implementation BEPCarro

-(NSString *) description
{
    return [NSString stringWithFormat:@"Modelo %@, Ano: %@, Potencia: %d, Roda %@", _modelo, _ano, _potencia, _roda];
}

@end
