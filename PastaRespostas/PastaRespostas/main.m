//
//  main.m
//  PastaRespostas
//
//  Created by Rodrigo Von-Grapp Freitas on 08/05/14.
//  Copyright (c) 2014 Rodrigo Von-Grapp Freitas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Util.h"

//########################################
//Metodos para respostas
@interface Respostas : NSObject

+(NSString *) questao_1_1;

@end
@implementation Respostas

+(NSString*) questao_1_1{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    int dirCount = 0;
    for(NSString *str in de){
        
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(diretorio){
            dirCount++;
            //    NSLog(@"%@\n",auxiliar);// Caminho completo ate os diretorios que interessa.
            //    NSLog(@"%@\n",str); //Diretorios que interessa.
        }
    }
    NSString *result = [NSString stringWithFormat:@"%d",dirCount];
    return result;
}
+(NSString*) questao_1_2{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    int arqCount = 0;
    for(NSString *str in de){
        
        NSString *auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(!diretorio){
            arqCount++;
            //    NSLog(@"%@\n",auxiliar);// Caminho completo ate os diretorios que interessa.
            //    NSLog(@"%@\n",str); //Diretorios que interessa.
        }
    }
    NSString *result = [NSString stringWithFormat:@"%d",arqCount];
    return result;
}

+(NSString*) questao_1_3{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    NSMutableSet *listaTipo = [[NSMutableSet alloc]init];
    int tipoCount=0;
    for(NSString *str in de){
        
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(!diretorio){
            NSString * extension = [auxiliar pathExtension];
            if(![listaTipo containsObject:extension]) {
                tipoCount++;
            }
        }
    }
    NSString *result = [NSString stringWithFormat:@"%d",tipoCount];
    return result;
}
+(NSString*) questao_1_4{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    NSMutableSet *listaTipo = [[NSMutableSet alloc]init];
    
    for(NSString *str in de){
        
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(!diretorio){
            NSString * extension = [auxiliar pathExtension];
            
            if(![listaTipo containsObject:extension]) {
                [listaTipo addObject:extension];
            }
        }
    }
    NSArray * aux = [listaTipo allObjects];
    NSString *result ;
    for(int i =0;i< [listaTipo count];i++){
        result = [NSString stringWithFormat:@"%@%@, ",result,[aux objectAtIndex:i]];
        
    }
    return result;
}
+(NSString*) questao_1_5{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    NSMutableSet *listaTipo = [[NSMutableSet alloc]init];
    
    for(NSString *str in de){
        
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(!diretorio){
            NSString * extension = [auxiliar pathExtension];
            if(![listaTipo containsObject:extension]) {
                [listaTipo addObject:extension];
            }
        }
    }
    
    NSArray *arrayTipo=[listaTipo allObjects];
    NSMutableArray * arrayCount = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[arrayTipo count];i++){
        NSNumber *x = [[NSNumber alloc]initWithInt:0];
        [arrayCount addObject:x];
        
    }
    
    de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    for(NSString *str in de){
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        
        if(!diretorio){
            NSUInteger i = 0;
            for(int j=0;j<[arrayTipo count];j++){
                if([[arrayTipo objectAtIndex:j] isEqualToString:[auxiliar pathExtension]]){
                    i=j;
                }
            }
            int aux =[[arrayCount objectAtIndex:i] intValue];
            aux++;
            [arrayCount replaceObjectAtIndex:i withObject:[[NSNumber alloc] initWithInt:aux]];
        }
    }
    NSString *result = [[NSString alloc]init];
    for(int x=0; x<[arrayCount count];x++){
       result =[NSString stringWithFormat:@"%@%@:%@,",result,[arrayTipo objectAtIndex:x], [arrayCount objectAtIndex:x]];
    }
    return result;
}
+(NSString*) questao_1_6{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    NSMutableSet *listaTipo = [[NSMutableSet alloc]init];
    
    for(NSString *str in de){
        
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(!diretorio){
            NSString * extension = [auxiliar pathExtension];
            if(![listaTipo containsObject:extension]) {
                [listaTipo addObject:extension];
            }
        }
    }
    
    NSArray *arrayTipo=[listaTipo allObjects];
    NSMutableArray * arrayCount = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[arrayTipo count];i++){
        NSNumber *x = [[NSNumber alloc]initWithInt:0];
        [arrayCount addObject:x];
        
    }
    
    de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    for(NSString *str in de){
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        
        if(!diretorio){
            NSUInteger i = 0;
            for(int j=0;j<[arrayTipo count];j++){
                if([[arrayTipo objectAtIndex:j] isEqualToString:[auxiliar pathExtension]]){
                    i=j;
                }
            }
            int aux =[[arrayCount objectAtIndex:i] intValue];
            NSFileManager *fileManager = [[NSFileManager alloc]init];
            NSDictionary * attributeDic = [fileManager attributesOfItemAtPath:auxiliar error:NULL];
            aux+= [[attributeDic objectForKey:NSFileSize] intValue];
          
            [arrayCount replaceObjectAtIndex:i withObject:[[NSNumber alloc] initWithInt:aux]];
        }
    }
    NSString *result = [[NSString alloc]init];
    for(int x=0; x<[arrayCount count];x++){
        result =[NSString stringWithFormat:@"%@%@:%@,",result,[arrayTipo objectAtIndex:x], [arrayCount objectAtIndex:x]];
    }
    return result;
}
+(NSString*) questao_1_7{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    NSMutableSet *listaTipo = [[NSMutableSet alloc]init];
    
    for(NSString *str in de){
        
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(!diretorio){
            NSString * extension = [auxiliar pathExtension];
            if(![listaTipo containsObject:extension]) {
                [listaTipo addObject:extension];
            }
        }
    }
    
    NSArray *arrayTipo=[listaTipo allObjects];
    NSMutableArray * arrayCount = [[NSMutableArray alloc]init];
    NSMutableArray * arrayMin = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[arrayTipo count];i++){
        NSNumber *x = [[NSNumber alloc]initWithInt:0];
        NSNumber *j = [[NSNumber alloc]initWithInt:2147483646];
        [arrayCount addObject:x];
        [arrayMin addObject:j];
        
    }
    
    de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    for(NSString *str in de){
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        
        if(!diretorio){
            NSUInteger i = 0;
            for(int j=0;j<[arrayTipo count];j++){
                if([[arrayTipo objectAtIndex:j] isEqualToString:[auxiliar pathExtension]]){
                    i=j;
                }
            }
            
            int aux =[[arrayCount objectAtIndex:i] intValue];
            
            NSFileManager *fileManager = [[NSFileManager alloc]init];
            NSDictionary * attributeDic = [fileManager attributesOfItemAtPath:auxiliar error:NULL];
            
            if([[attributeDic objectForKey:NSFileSize] intValue]<[[arrayMin objectAtIndex:i]intValue] ){
                [arrayMin replaceObjectAtIndex:i withObject:[[NSNumber alloc] initWithInt:[[attributeDic objectForKey:NSFileSize] intValue]]];
            }
            

            aux+= [[attributeDic objectForKey:NSFileSize] intValue];
            
            [arrayCount replaceObjectAtIndex:i withObject:[[NSNumber alloc] initWithInt:aux]];
        }
    }
    NSString *result = [[NSString alloc]init];
    for(int x=0; x<[arrayMin count];x++){
        result =[NSString stringWithFormat:@"%@%@:%@,",result,[arrayTipo objectAtIndex:x], [arrayMin objectAtIndex:x]];
    }
    return result;
}
+(NSString*) questao_1_8{
    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    NSMutableSet *listaTipo = [[NSMutableSet alloc]init];
    
    for(NSString *str in de){
        
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        if(!diretorio){
            NSString * extension = [auxiliar pathExtension];
            if(![listaTipo containsObject:extension]) {
                [listaTipo addObject:extension];
            }
        }
    }
    
    NSArray *arrayTipo=[listaTipo allObjects];
    NSMutableArray * arrayCount = [[NSMutableArray alloc]init];
    NSMutableArray * arrayMax = [[NSMutableArray alloc]init];
    
    for(int i=0;i<[arrayTipo count];i++){
        NSNumber *x = [[NSNumber alloc]initWithInt:0];
        [arrayCount addObject:x];
        [arrayMax addObject:x];
        
    }
    
    de = [[NSFileManager defaultManager] enumeratorAtPath: [Util caminhoPastaAmbiente]];
    for(NSString *str in de){
        NSString * auxiliar = [NSString stringWithFormat:@"%@/%@",[Util caminhoPastaAmbiente],str];
        BOOL diretorio;
        [[NSFileManager defaultManager]fileExistsAtPath:auxiliar isDirectory:&diretorio];
        
        if(!diretorio){
            NSUInteger i = 0;
            for(int j=0;j<[arrayTipo count];j++){
                if([[arrayTipo objectAtIndex:j] isEqualToString:[auxiliar pathExtension]]){
                    i=j;
                }
            }
            
            int aux =[[arrayCount objectAtIndex:i] intValue];
            
            NSFileManager *fileManager = [[NSFileManager alloc]init];
            NSDictionary * attributeDic = [fileManager attributesOfItemAtPath:auxiliar error:NULL];
            
            if([[attributeDic objectForKey:NSFileSize] intValue]>[[arrayMax objectAtIndex:i]intValue] ){
                [arrayMax replaceObjectAtIndex:i withObject:[[NSNumber alloc] initWithInt:[[attributeDic objectForKey:NSFileSize] intValue]]];
            }
            
            
            aux+= [[attributeDic objectForKey:NSFileSize] intValue];
            
            [arrayCount replaceObjectAtIndex:i withObject:[[NSNumber alloc] initWithInt:aux]];
        }
    }
    NSString *result = [[NSString alloc]init];
    for(int x=0; x<[arrayMax count];x++){
        result =[NSString stringWithFormat:@"%@%@:%@,",result,[arrayTipo objectAtIndex:x], [arrayMax objectAtIndex:x]];
    }
    return result;
}



+(NSString*) questao_1_9{
    NSMutableArray * listaTelefones = [[NSMutableArray alloc]init];
    
    [listaTelefones addObjectsFromArray:[Util procuraPorExpressao:@"\\d{2}[(]\\d{2}[)]\\d{8}" formatSize:16]];//55(55)55555555
    [listaTelefones addObjectsFromArray:[Util procuraPorExpressao:@"[(]\\d{2}[)]\\d{4}-\\d{4}" formatSize:13]];//(61)5555-5555
    
    NSMutableArray * aux = [Util procuraPorExpressao:@"\\d{4}-\\d{4}" formatSize:9];//5555-5555
    int aux2=0;
    for(int i = 0; i< [aux count]; i++ ){
        for(int j=0; j< [listaTelefones count];j++){
            
            if(!([[listaTelefones objectAtIndex:j] rangeOfString:[aux objectAtIndex:i]].location==NSNotFound)){
                aux2=1;
            }
        }
        if(aux2==0) [listaTelefones addObject: [aux objectAtIndex:i]];
        aux2=0;
    }
    
   
    aux = [Util procuraPorExpressao:@"\\d{8}" formatSize:8];
    
    
    for(int i = 0; i< [aux count]; i++ ){
        for(int j=0; j< [listaTelefones count];j++){
            
            if(!([[listaTelefones objectAtIndex:j] rangeOfString:[aux objectAtIndex:i]].location==NSNotFound)){
                aux2=1;
            }
        }
        if(aux2==0) [listaTelefones addObject: [aux objectAtIndex:i]];
        aux2=0;
    }
    
    NSString *result = [[NSString alloc]init];
    for(int x=0; x<[listaTelefones count];x++){
        result =[NSString stringWithFormat:@"%@%@,",result,[listaTelefones objectAtIndex:x]];
    }
    
    return result;

}


@end
//######################################

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        [Util criaPastaRespostas]; //Criar pasta de respostas
        NSString *q1 = [Respostas questao_1_1];
        NSString *q2 = [Respostas questao_1_2];
        NSString *q3 = [Respostas questao_1_3];
        NSString *q4 = [Respostas questao_1_4];
        NSString *q5 = [Respostas questao_1_5];
        NSString *q6 = [Respostas questao_1_6];
        NSString *q7 = [Respostas questao_1_7];
        NSString *q8 = [Respostas questao_1_8];
        NSString *q9 = [Respostas questao_1_9];
        NSMutableString *resultFinal = [[NSMutableString alloc]init];
        
        [resultFinal appendString:[NSString stringWithFormat:@"1 - %@\n2 - %@\n3 - %@\n4 - %@\n5 - %@\n6 - %@\n7 - %@\n8 - %@\n9 - %@\n", q1,q2,q3,q4,q5,q6,q7,q8,q9]];
        
        [resultFinal writeToFile:[NSString stringWithFormat:@"/%@/respostas_desafio_1.txt",[Util caminhoPastaRespostas]] atomically:YES encoding:NSUTF8StringEncoding error:NULL];
       
        
    }
    
    return 0;
}


