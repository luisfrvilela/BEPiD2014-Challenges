//
//  main.m
//  Desafio010605
//
//  Created by ALS on 06/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NSMutableString * (^bloco)(NSMutableString *palavra);
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableString *nome = [[NSMutableString alloc]initWithString:@"Luis Filipe Resende Vilela"];
        
        NSMutableString *livro = [[NSMutableString alloc]initWithString:@"Codigo da Vinci"];
        
        NSMutableString *filme = [[NSMutableString alloc]initWithString:@"Tropa de Elite"];
        
        bloco brancoUnderscore = ^NSMutableString*(NSMutableString *palavra){
          
            [palavra replaceOccurrencesOfString:@" "
                    withString:@"_"
                options:NSLiteralSearch
                    range:NSMakeRange(0, [palavra length])];
            return  palavra;
            
        };

        NSMutableString *resultado = [[NSMutableString alloc]init];
        
        [resultado appendString:brancoUnderscore(nome)];
        [resultado appendString:brancoUnderscore(livro)];
        [resultado appendString:brancoUnderscore(filme)];
        
        NSLog(@"%@",resultado);
    
        
    }
    return 0;
}

