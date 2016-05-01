//
//  BEPNome.m
//  Desafio1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "BEPNome.h"

@implementation BEPNome
-(id)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BEPNome sharedNome]" userInfo:nil];
    
    return nil;
}

+(id)sharedNome{
    static BEPNome *sharedNome = nil;
    
    if(!sharedNome){
        sharedNome = [[self alloc]initPrivate];
    }
    return sharedNome;
}

-(id)initPrivate{
    self = [super init];
    
    if(self){
        _nome = [[NSString alloc]init];
        _nome = @"Nome default";
        _idade = 0;
        _altura = 0.0;
        _peso = 0.0;
    }
    return self;
}

-(id) obterSharedNome{
    return self.nome;
}

-(void) setarSharedNome: (NSString *)nome{
    _nome = nome;
}

-(int) obterSharedIdade{
    return self.idade;
}

-(void) setarSharedIdade:(int)idade{
    _idade = idade;
}

-(float) obterSharedAltura{
    return self.altura;
}

-(void) setarSharedAltura:(float)altura{
    _altura = altura;
}

-(float) obterSharedPeso{
    return self.peso;
}

-(void) setarSharedPeso:(float)peso{
    _peso = peso;
}
@end

