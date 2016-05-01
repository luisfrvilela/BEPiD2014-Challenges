//
//  main.m
//  CadastroDeFuncionarios
//
//  Created by ALS on 11/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEPiDFuncionario.h"
#import "BEPiDEmpresa.h"
int main(int argc, const char * argv[])
{

@autoreleasepool {
        
BEPiDEmpresa *empresaFuncionarios = [[BEPiDEmpresa alloc]init];

    BEPiDFuncionario *funcionario1 = [[BEPiDFuncionario alloc]init];
[funcionario1 setNome:@"Luis"];
[funcionario1 setId:1];
[funcionario1 setSalario:1500.00];
    
    BEPiDFuncionario *funcionario2 = [[BEPiDFuncionario alloc]init];
    [funcionario2 setNome:@"Rodrigo"];
    [funcionario2 setId:2];
    [funcionario2 setSalario:2500.00];
    
    BEPiDFuncionario *funcionario3 = [[BEPiDFuncionario alloc]init];
    [funcionario3 setNome:@"Lais"];
    [funcionario3 setId:3];
    [funcionario3 setSalario:3500.00];
    
    BEPiDFuncionario *funcionario4 = [[BEPiDFuncionario alloc]init];
    [funcionario4 setNome:@"Laura"];
    [funcionario4 setId:4];
    [funcionario4 setSalario:4500.00];
    
    BEPiDFuncionario *funcionario5 = [[BEPiDFuncionario alloc]init];
    [funcionario5 setNome:@"Rebeca"];
    [funcionario5 setId:5];
    [funcionario5 setSalario:5500.00];
    
    BEPiDFuncionario *funcionario6 = [[BEPiDFuncionario alloc]init];
    [funcionario6 setNome:@"Alessandra"];
    [funcionario6 setId:6];
    [funcionario6 setSalario:6500.00];
    
    BEPiDFuncionario *funcionario7 = [[BEPiDFuncionario alloc]init];
    [funcionario7 setNome:@"Eduarda"];
    [funcionario7 setId:7];
    [funcionario7 setSalario:7500.00];
    
    BEPiDFuncionario *funcionario8 = [[BEPiDFuncionario alloc]init];
    [funcionario8 setNome:@"Fernanda"];
    [funcionario8 setId:8];
    [funcionario8 setSalario:8500.00];
    
    BEPiDFuncionario *funcionario9 = [[BEPiDFuncionario alloc]init];
    [funcionario9 setNome:@"Juliana"];
    [funcionario9 setId:9];
    [funcionario9 setSalario:9500.00];
    
    BEPiDFuncionario *funcionario10 = [[BEPiDFuncionario alloc]init];
    [funcionario10 setNome:@"Groria"];
    [funcionario10 setId:10];
    [funcionario10 setSalario:19500.00];
    
    [empresaFuncionarios setFuncionarios:funcionario1];
    [empresaFuncionarios setFuncionarios:funcionario2];
    [empresaFuncionarios setFuncionarios:funcionario3];
    [empresaFuncionarios setFuncionarios:funcionario4];
    [empresaFuncionarios setFuncionarios:funcionario5];
    [empresaFuncionarios setFuncionarios:funcionario6];
    [empresaFuncionarios setFuncionarios:funcionario7];
    [empresaFuncionarios setFuncionarios:funcionario8];
    [empresaFuncionarios setFuncionarios:funcionario9];
    [empresaFuncionarios setFuncionarios:funcionario10];
    
    
    NSLog(@"%@",[empresaFuncionarios description]);
    
    
}
    return 0;
}

