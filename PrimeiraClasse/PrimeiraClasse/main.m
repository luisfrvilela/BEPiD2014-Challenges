//
//  main.m
//  PrimeiraClasse
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pessoa.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        
        //Cria a instancia da classe
        Pessoa *pessoa = [[Pessoa alloc]init];
        
        //Atribuindo os valores no setters
        [pessoa setPeso:59];
        [pessoa setAltura:1.8];
        
        //pegar os dados das variaveis
        float alt = [pessoa altura];
        int pes = [pessoa peso];
        
        NSLog(@"\nLuis tem %.2f de altura e pesa %d quilos", alt, pes);
        
        //Chamando o metodo para calcular a massa corporal
        float totalMassa = [pessoa massaCorporal];
        NSLog(@"Ä massa corporal de Luis e de %.2f", totalMassa);
        
    }
    return 0;
}

