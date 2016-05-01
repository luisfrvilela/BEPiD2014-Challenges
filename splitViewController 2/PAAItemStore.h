//
//  PAAItemStore.h
//  splitViewController
//
//  Created by Luís Resende on 16/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PAAItem;

@interface PAAItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+(instancetype)sharedStore;
- (PAAItem *)createItem;

@end
