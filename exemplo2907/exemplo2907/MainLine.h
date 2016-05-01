//
//  MainLine.h
//  exemplo2907
//
//  Created by Rodrigo Von-Grapp Freitas on 29/07/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainLine : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;
@property (nonatomic) float width;

-(void)stroke;
-(BOOL)havePoint:(CGPoint)point;
@end
