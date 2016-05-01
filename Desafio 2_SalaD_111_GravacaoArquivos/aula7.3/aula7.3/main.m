//
//  main.m
//  aula7.3
//
//  Created by Cayke on 29/04/14.
//  Copyright (c) 2014 Cayke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Endereco.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Endereco *novoEndereco = [[Endereco alloc]initWithCep:@"72110800"];
        
        NSError *error;
        
        NSString *str= [[NSString alloc]initWithString:[novoEndereco description]];
        
        NSLog(@"%@", str);
        
        [str writeToFile:@"/tmp/endereco.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if(error)
        {
            NSLog(@"%@", [error localizedDescription]);
        }
        
    }
    return 0;
}

