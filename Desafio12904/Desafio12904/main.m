//
//  main.m
//  Desafio12904
//
//  Created by ALS on 29/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDUsuario.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BEPiDUsuario *novoUsuario = [[BEPiDUsuario alloc]init];
        [novoUsuario setNascimento:@"05/08/1994"];
        [novoUsuario setDataCriacao];
        NSLog(@"%@", [novoUsuario nascimento]);
        NSLog(@"%@", [novoUsuario dataCriacao]);
        
    

        
    }
    return 0;
}

