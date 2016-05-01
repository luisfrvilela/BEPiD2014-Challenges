//
//  main.m
//  Callback
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Logger *log = [[Logger alloc]init];
        /*NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                          target:log
                          selector:@selector(updateLastTime:)
                          userInfo:nil
                        repeats:YES];*/
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc]initWithRequest:request
            delegate:log
            startImmediately:YES];
        
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:log selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]run];
        
        [[NSNotificationCenter defaultCenter]addObserver:log selector:@selector(zoneChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
        
    }
    return 0;
}

