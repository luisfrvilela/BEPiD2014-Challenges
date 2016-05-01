//
//  main.m
//  Desafio020705
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSError *erro;
        
       /* NSArray *path = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        NSString *desktop = [path objectAtIndex:0];*/
        
        NSMutableArray *arrayString = [[NSMutableArray alloc]init];
        
        [[NSFileManager defaultManager] createDirectoryAtPath:@"/users/teste/Mesa/Listas" withIntermediateDirectories:YES attributes:nil error:&erro];
        
        NSMutableDictionary * string1 = [[NSMutableDictionary alloc]init];
        [string1 setObject:@"Luis Filipe Resende Vilela" forKey:@"nome"];
        
        [arrayString addObject:string1];
        
        [arrayString writeToFile:@"/users/teste/Mesa/Listas/NSString.plist" atomically:YES];
        
        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/users/teste/Mesa/Listas/NSString.plist"];
        
        for(NSDictionary *item in stockList){
            NSLog(@"%@",item);
        }

        
    }
    return 0;
}

