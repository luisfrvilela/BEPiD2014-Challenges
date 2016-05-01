//
//  main.m
//  Desafio23004
//
//  Created by ALS on 30/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Professor.h"
#import "Aluno.h"
int main(int argc, const char * argv[])
{

    Professor *novoProfessor = [[Professor alloc]init];
    
    @autoreleasepool {
        
        for(int i=0; i<10; i++){
            Aluno *novoAluno = [[Aluno alloc]init];
            [novoAluno setMatricula: [NSString stringWithFormat:@"%d",i]];
            [novoAluno setNome:@"Novo Aluno"];
            [novoAluno setSexo:@"masculino"];
            [novoProfessor.listaDeAlunos addObject:novoAluno];
        }
        
        NSLog(@"%@",novoProfessor);
        
    }
    return 0;
}

