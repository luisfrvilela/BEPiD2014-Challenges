//
//  MainCircle.h
//  exemplo2907
//
//  Created by Rodrigo Von-Grapp Freitas on 30/07/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainCircle : NSObject <NSCoding>

@property (nonatomic) float radianos;
@property (nonatomic) CGPoint valorCentral;
@property (nonatomic) UIColor *corCirculo;


-(BOOL)havePoint:(CGPoint)point;
@end
