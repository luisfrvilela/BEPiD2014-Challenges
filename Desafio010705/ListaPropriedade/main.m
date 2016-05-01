//
//  main.m
//  ListaPropriedade
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *arvoreGenealogica = [[NSMutableArray alloc]init];
        
        NSMutableDictionary * avoPaterno = [[NSMutableDictionary alloc]init];
        [avoPaterno setObject:@"Nono" forKey:@"nome"];
        [avoPaterno setObject:@"nono@gmail.com" forKey:@"email"];
        [avoPaterno setObject:[NSNumber numberWithInt:80]forKey:@"idade"];
        [avoPaterno setObject:@"78945612" forKey:@"telefone"];
        
        [arvoreGenealogica addObject:avoPaterno];
        
        
        NSMutableDictionary * avoPaterna = [[NSMutableDictionary alloc]init];
        [avoPaterna setObject:@"Wandir Vilela" forKey:@"nome"];
        [avoPaterna setObject:@"vanda@gmail.com" forKey:@"email"];
        [avoPaterna setObject:[NSNumber numberWithInt:67]forKey:@"idade"];
        [avoPaterna setObject:@"12345678" forKey:@"telefone"];
        
        [arvoreGenealogica addObject:avoPaterna];
        
        
        NSMutableDictionary * mae = [[NSMutableDictionary alloc]init];
        [mae setObject:@"Doralice de Fatima Resende Vilela" forKey:@"nome"];
        [mae setObject:@"doralice@gmail.com" forKey:@"email"];
        [mae setObject:[NSNumber numberWithInt:46]forKey:@"idade"];
        [mae setObject:@"36925814" forKey:@"telefone"];
        
        [arvoreGenealogica addObject:mae];
        
        NSMutableDictionary * pai = [[NSMutableDictionary alloc]init];
        [pai setObject:@"Joao Darcio Amaral Vilela" forKey:@"nome"];
        [pai setObject:@"darcio@gmail.com" forKey:@"email"];
        [pai setObject:[NSNumber numberWithInt:47]forKey:@"idade"];
        [pai setObject:@"85236974" forKey:@"telefone"];
        
        [arvoreGenealogica addObject:pai];
        
        NSMutableDictionary * irmao = [[NSMutableDictionary alloc]init];
        [irmao setObject:@"Gustavo Resende Vilela" forKey:@"nome"];
        [irmao setObject:@"gustavo@gmail.com" forKey:@"email"];
        [irmao setObject:[NSNumber numberWithInt:16]forKey:@"idade"];
        [irmao setObject:@"89746523" forKey:@"telefone"];
        
        [arvoreGenealogica addObject:irmao];
        
        NSMutableDictionary * eu = [[NSMutableDictionary alloc]init];
        [eu setObject:@"Luis Filipe Resende Vilela" forKey:@"nome"];
        [eu setObject:@"luisfrvilela@gmail.com" forKey:@"email"];
        [eu setObject:[NSNumber numberWithInt:19]forKey:@"idade"];
        [eu setObject:@"00000000" forKey:@"telefone"];
        
        [arvoreGenealogica addObject:eu];
        
        [arvoreGenealogica writeToFile:@"/tmp/stocks.plist" atomically:YES];
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        
        for(NSDictionary *item in stockList){
            NSLog(@"%@",item);
        }
    
    }
    return 0;
}

