//
//  main.m
//  aula7.2
//
//  Created by Cayke on 29/04/14.
//  Copyright (c) 2014 Cayke. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSError * error;
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://www.bepid.com.br/brasilia/App_Themes/OnePage/images/logo.png"]];
            
        
        [imageData writeToFile:@"/tmp/imagembepid.png" options:NSDataWritingAtomic error:&error];
        
        if(error)
        {
            NSLog(@"%@", [error localizedDescription]);
        }

    }
    return 0;
}

