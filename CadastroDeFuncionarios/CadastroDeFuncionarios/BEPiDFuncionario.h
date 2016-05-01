//
//  BEPiDFuncionario.h
//  CadastroDeFuncionarios
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPiDFuncionario : NSObject
{
    //Declarando duas instancias de variaveis
    float _salario;
    int _id;
    NSString *_nome;
}

//metodos para ler e atribuir as instancias das variaveis

-(int)id;
-(void)setId:(int)idFunc;

-(float)salario;
-(void)setSalario:(float)salFunc;

-(NSString *)nome;
-(void)setNome:(NSString *)nomeFunc;

-(NSString *)description;

@end
