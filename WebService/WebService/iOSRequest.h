//
//  iOSRequest.h
//  WebService
//
//  Created by Luís Resende on 27/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestCompletionHandler)(NSString*, NSError*);

@interface iOSRequest : NSObject
+(void)requestToPath: (NSString *)path onCompletion: (RequestCompletionHandler)complete;
@end
