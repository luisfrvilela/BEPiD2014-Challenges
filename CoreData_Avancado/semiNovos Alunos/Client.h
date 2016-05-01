//
//  Client.h
//  semiNovos
//
//  Created by Luís Resende on 03/10/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Car;

@interface Client : NSManagedObject

@property (nonatomic, retain) UIImage *thumbnail;
@property (nonatomic, retain) UIImage *photo;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSSet *own;

-(void)setThumbnailFromImage:(UIImage*)image;

@end
