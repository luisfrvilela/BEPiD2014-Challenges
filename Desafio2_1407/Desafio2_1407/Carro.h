//
//  Carro.h
//  Desafio2_1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carro : NSObject

@property (nonatomic) NSMutableArray *carros;
@property (nonatomic) int index;

+(id)sharedCarros;

-(id)obterSharedCarros;

-(void)setarSharedCarros: (NSDictionary *)carro :(int)index;

-(id)initPrivate;

-(int)obterIndex;

-(void)setarIndex: (int) index;



@end
