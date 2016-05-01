//
//  PAAItem.m
//  splitViewController
//
//  Created by Luís Resende on 16/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "PAAItem.h"

@implementation PAAItem

+(instancetype)randomItem{
    
    PAAItem *p;
    
    if (self == [PAAItem class]) {
        p = [[PAAItem alloc]init];
        
        NSArray *primeiroNome = [[NSArray alloc]initWithObjects:@"iPhone",@"iPad",@"iMac",@"MacBook",@"MacMini",@"Ipod", nil];
        
        NSArray *segundoNome = [[NSArray alloc]initWithObjects:@"Antônio",@"Bruno",@"Cezar",@"Daniel",@"Elton",@"Fábio",@"Guilherme", nil];
        
        p.itemName = [NSString stringWithFormat:@"%@ do %@",[primeiroNome objectAtIndex:arc4random()%6], [segundoNome objectAtIndex:arc4random()%7]];
       
        p.value = arc4random()%15000;
        
        p.serialNumber = [NSString stringWithFormat:@"%d%c%d%c%d",arc4random()%10,(arc4random()%25+65),arc4random()%10,(arc4random()%25+65),arc4random()%10];
        
       // p.dateCreated = [NSDate date];
        
    }
    return p;
}

@end
