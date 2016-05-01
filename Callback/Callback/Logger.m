//
//  Logger.m
//  Callback
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "Logger.h"

@implementation Logger

-(NSString *) lastTimeString
{
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"formato criado");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

-(void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"tempo de %@", self.lastTimeString);
}

//calcula cada tempo do pedaco de dados que chegou
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //criando o mutable data se nao existir
    if(!__incomingData){
        __incomingData = [[NSMutableData alloc]init];
    }
    
    [__incomingData appendData:data];
}

//chamando o metodo quando o ultimo pedaco de codigo for processado
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"pegou tudo");
    NSString *string = [[NSString alloc]initWithData:__incomingData encoding:NSUTF8StringEncoding];
    
    __incomingData = nil;
    
    NSLog(@"ele tem %lu de caracters", [string length]);
    
    //vamos ver o total de linhas do arquivo
    NSLog(@"toda string e %@",string);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"a conexao falhou %@", [error localizedDescription]);
    __incomingData = nil;
}

-(void)zoneChange: (NSNotification *)note
{
    NSLog(@"o time do sistema foi alterado");
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
