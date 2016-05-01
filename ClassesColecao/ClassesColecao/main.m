//
//  main.m
//  ClassesColecao
//
//  Created by ALS on 02/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDictionary *numeroDeLuas;
        numeroDeLuas = [[NSDictionary alloc]initWithObjects:@[@0, @0, @1, @2, @67, @62, @27, @13] forKeys:@[@"Mercurio", @"Venus", @"Terra", @"Marte", @"Jupter", @"Saturno", @"Urano", @"Netuno"]];
        
        numeroDeLuas = @{@"Mercurio" : @0,
                         @"Venus" : @0,
                         @"Terra" : @1,
                         @"Marte" : @2,
                         @"Jupter" : @67,
                         @"Saturno" : @62,
                         @"Urano" : @27,
                         @"Netuno" : @13};
        
        NSLog(@"%@", numeroDeLuas);
        NSLog(@"%@", [numeroDeLuas objectForKey:@"Terra"]);
    
    }
    return 0;
}

