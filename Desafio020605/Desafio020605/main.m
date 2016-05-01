//
//  main.m
//  Desafio020605
//
//  Created by ALS on 06/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Veiculo.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Veiculo *novoVeiculo = [[Veiculo alloc]init];
        
        NSLog(@"%f",novoVeiculo.andar);
        
    }
    return 0;
}

