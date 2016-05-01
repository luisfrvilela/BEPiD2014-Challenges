//
//  main.m
//  DesafioRevisao3004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPCarro.h"
#import "BEPRoda.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BEPCarro *Carro1 = [[BEPCarro alloc]init];
        BEPRoda *Roda1 = [[BEPRoda alloc]init];
        
        [Roda1 setAro:13];
        [Roda1 setLargura:40];
        [Roda1 setPerfil:1];
        [Roda1 setMaterial:@"aluminio"];
        
        [Carro1 setModelo:@"Fiat Uno"];
        [Carro1 setAno:@"1967"];
        [Carro1 setPotencia:50];
        [Carro1 setRoda:Roda1];
        
        NSLog(@"%@", Carro1);
        
        
        
    }
    return 0;
}

