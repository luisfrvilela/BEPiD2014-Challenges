//
//  Brand.h
//  semiNovos
//
//  Created by Luís Resende on 03/10/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Car;

@interface Brand : NSManagedObject

@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) Car *car;

@end
