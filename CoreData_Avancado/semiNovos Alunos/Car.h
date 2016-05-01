//
//  Car.h
//  semiNovos
//
//  Created by Luís Resende on 03/10/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Car : NSManagedObject

@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * manufactureYear;
@property (nonatomic, retain) NSString * modelYear;
@property (nonatomic, retain) NSString * model;
@property (nonatomic, retain) NSManagedObject *brand;
@property (nonatomic, retain) NSManagedObject *owner;

@end
