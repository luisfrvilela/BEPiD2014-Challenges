//
//  Pessoa.m
//  PrimeiraClasse
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Pessoa.h"

@implementation Pessoa

-(float) altura
{
    return _altura;
}

-(void) setAltura:(float)a
{
    _altura = a;
}

-(int) peso
{
    return _peso;
}

-(void) setPeso:(int)p
{
    _peso = p;
}

-(float) massaCorporal
{
    float a = [self altura]; //self e igual o this
    return [self peso]/(a*a);
}
@end
