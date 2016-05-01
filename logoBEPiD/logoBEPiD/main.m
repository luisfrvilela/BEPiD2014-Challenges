//
//  main.m
//  logoBEPiD
//
//  Created by ALS on 05/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
    
        NSError *erro;
        
        NSData *logoBEPiD = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://www.bepid.com.br/brasilia/App_Themes/OnePage/images/logo.png"]];
        
        [logoBEPiD writeToFile:@"/tmp/cool.png" options:NSDataWritingAtomic error:&erro];
        
    }
    return 0;
}

