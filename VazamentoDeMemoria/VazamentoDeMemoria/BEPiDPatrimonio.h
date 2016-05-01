//
//  BEPiDPatrimonio.h
//  VazamentoDeMemoria
//
//  Created by ALS on 02/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BEPiDAluno;

@interface BEPiDPatrimonio : NSObject

@property NSString *rotuloPatrimonio;
@property unsigned int valorRevenda;
@property (nonatomic, weak) BEPiDAluno *portador;

@end
