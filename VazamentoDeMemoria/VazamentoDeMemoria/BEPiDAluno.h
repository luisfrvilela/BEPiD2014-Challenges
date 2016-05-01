//
//  BEPiDAluno.h
//  VazamentoDeMemoria
//
//  Created by ALS on 02/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BEPiDPatrimonio;

@interface BEPiDAluno : NSObject

@property NSString *nomeAluno;
@property unsigned int matriculaAluno;

-(void) adicionarPatrimonio: (BEPiDPatrimonio *)p;
-(unsigned int) totalPatrimonio;

@end
