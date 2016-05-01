//
//  BEPCarro.h
//  DesafioRevisao3004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BEPRoda;
@interface BEPCarro : NSObject

@property (nonatomic) BEPRoda *roda;
@property (nonatomic) NSString *modelo;
@property (nonatomic) NSString *ano;
@property (nonatomic) int potencia;

@end
