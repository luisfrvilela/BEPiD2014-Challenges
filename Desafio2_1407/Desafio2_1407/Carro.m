//
//  Carro.m
//  Desafio2_1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "Carro.h"

@implementation Carro

+(id)sharedCarros{
    
    static Carro *shareCarros = nil;
    if(!shareCarros){
        shareCarros = [[self alloc]initPrivate];
    }
    return shareCarros;
}


-(id)initPrivate{
    self = [super init];
    if(self){
        NSString *caminho = [[NSBundle mainBundle]pathForResource:@"carros" ofType:@"plist"];
        
        self.carros = [[NSMutableArray alloc]initWithContentsOfFile:caminho];
    }
    return self;
}

-(id)init{
    
    @throw [NSException exceptionWithName:@"singleton" reason:@"Use + [CarrosSingleton sharedNome]" userInfo:nil];
    return nil;
}

-(id)obterSharedCarros{
    return self.carros;
}

-(void)setarSharedCarros:(NSDictionary *)carro :(int)index{
    
    [_carros setObject:carro atIndexedSubscript:index];
}

-(void)setarIndex:(int)index{
    self.index = index;
}

-(int)obterIndex{
    return self.index;
}

@end
