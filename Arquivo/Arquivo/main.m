//
//  main.m
//  Arquivo
//
//  Created by ALS on 05/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableString *str = [[NSMutableString alloc]init];
        
        for(int i=0; i<10; i++){
            
           [str appendString:@"Eu sou cool! \n"];
        }
        
        NSError *error;
        
        [str writeToFile:@"/tmp/cool.txt"
              atomically: YES
                encoding: NSUTF8StringEncoding
                   error: &error];
        NSLog(@"escrevendo no arquivo /tmp/cool.txt");
        
        NSString *strA = [[NSString alloc]
                initWithContentsOfFile:@"/etc/resultado.conf"
                encoding:NSASCIIStringEncoding
                          error:&error];
        
        if(!strA){
            NSLog(@"Falhou: %@", [error localizedDescription]);
        }
        else{
            NSLog(@"pegou os dados %@", strA);
        }
        
    }
    
    return 0;
}

