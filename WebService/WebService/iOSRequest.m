//
//  iOSRequest.m
//  WebService
//
//  Created by Luís Resende on 27/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "iOSRequest.h"

@implementation iOSRequest

+(void)requestToPath:(NSString *)path onCompletion:(RequestCompletionHandler)complete
{
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc]init];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:path]
                                                 cachePolicy:NSURLCacheStorageAllowedInMemoryOnly
                                             timeoutInterval:10];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:backgroundQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                               if(complete) complete(result, error);
                           }];
}

@end
