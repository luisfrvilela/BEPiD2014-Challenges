//
//  MainCircle.h
//  Paint
//
//  Created by Luís Resende on 31/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainCircle : NSObject

@property (nonatomic) CGPoint centro;
@property (nonatomic) float radianos;
@property (nonatomic) UIColor *corCirculo;

- (BOOL) havePoint: (CGPoint)point;
@end
