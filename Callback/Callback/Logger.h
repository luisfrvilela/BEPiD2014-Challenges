//
//  Logger.h
//  Callback
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData * __incomingData;
}

@property (nonatomic) NSDate *lastTime;

-(NSString *) lastTimeString;
-(void) updateLastTime: (NSTimer *)t;

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
-(void)connectionDidFinishLoading:(NSURLConnection *)connection;
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

@end
