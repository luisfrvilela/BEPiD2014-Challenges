//
//  PAAItem.h
//  splitViewController
//
//  Created by Luís Resende on 16/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAAItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valuee;
@property (nonatomic, readonly) NSDate *dateCreated;

-(instancetype)initWithItemName: (NSString *)name
                          value: (int)value
                   serialNumber: (NSString *)sNumber;

-(instancetype)initWithItemName: (NSString *)name;

+(instancetype)randomItem;


@end
