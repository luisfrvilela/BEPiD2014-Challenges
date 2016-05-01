//
//  Util.m
//  PastaRespostas
//
//  Created by Rodrigo Von-Grapp Freitas on 08/05/14.
//  Copyright (c) 2014 Rodrigo Von-Grapp Freitas. All rights reserved.
//

#import "Util.h"

@implementation Util

+(void)criaPastaRespostas{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSString *desktopPath = [path objectAtIndex:0];
    NSString *dir = [NSString stringWithFormat:@"%@/Ambiente/84respostas",desktopPath];
    
    NSFileManager *folder = [NSFileManager defaultManager];
    if([folder createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:NULL])
        NSLog(@"Pasta criada no diretorio Ambiente!\n");
}

+(NSString *)caminhoPastaAmbiente{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSString *desktopPath = [path objectAtIndex:0];
    NSString *dir = [NSString stringWithFormat:@"%@/Ambiente",desktopPath];
    return dir;
}

+(NSString *)caminhoPastaRespostas{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSString *desktopPath = [path objectAtIndex:0];
    NSString *dir = [NSString stringWithFormat:@"%@/Ambiente/84respostas",desktopPath];
    return dir;
}
+(NSMutableArray *) procuraPorExpressao:(NSString*) expression formatSize:(int)formatSize{
    
    NSString *strA = [[NSString alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/segredo.txt",[Util  caminhoPastaAmbiente] ] encoding:NSASCIIStringEncoding error: NULL];
    
    NSString *myString =strA;
    NSString *myRegex = expression;
    NSRange range;
    NSMutableArray * listaTelefones = [[NSMutableArray alloc]init];
    do{
        range = [myString rangeOfString:myRegex options:NSRegularExpressionSearch];
        
        if (range.location != NSNotFound) {
            //adiciona no array
            NSString * numero;
            numero = [myString substringWithRange:range];
            [listaTelefones addObject:numero];
            //cria substring
            NSString* subString = [myString substringFromIndex:range.location+formatSize];
            
            //continua
            myString= subString;
            //NSLog(@"%@", numero);
        } else {
            //NSLog(@"No phone number found");
            
        }
    }while(range.location!=NSNotFound);
    
    //NSLog(@"%@", listaTelefones);
    return listaTelefones;
}



@end
