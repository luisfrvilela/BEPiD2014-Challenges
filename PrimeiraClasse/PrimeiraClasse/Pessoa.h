//
//  Pessoa.h
//  PrimeiraClasse
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pessoa : NSObject
{
    //Declarando duas instancias de variaveis
    float _altura;
    int _peso;

}

//metodos para ler e atribuir as instancias das variaveis

-(int) peso;
-(void) setPeso: (int) p;

-(float) altura;
-(void) setAltura: (float) a;

//declaracao de metodo que calcula a massa corporal
-(float) massaCorporal;


@end
