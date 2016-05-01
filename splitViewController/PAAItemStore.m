//
//  PAAItemStore.m
//  splitViewController
//
//  Created by Luís Resende on 16/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "PAAItemStore.h"
#import "PAAItem.h"

@interface PAAItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation PAAItemStore

-(NSArray *)allItems
{
    return [NSArray arrayWithArray:self.privateItems];
}
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"singleton" reason:@"use + [paaitemstore singleton]" userInfo:nil];
    return nil;
}
-(instancetype)initPrivate{
    self = [super init];
    if (self) {
        self.privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}
+(instancetype)sharedStore{
    
    static PAAItemStore *p = nil;
    
    if (!p) {
        p = [[self alloc]initPrivate];
    }
    return p;
}

-(PAAItem *)createItem{
    PAAItem *i = [[PAAItem alloc] init];
    
    i = [PAAItem randomItem];
    
    [self.privateItems addObject:i];
    
    return i;
}
@end
