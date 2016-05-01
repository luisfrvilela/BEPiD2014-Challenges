//
//  MainCircle.m
//  exemplo2907
//
//  Created by Rodrigo Von-Grapp Freitas on 30/07/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import "MainCircle.h"

@implementation MainCircle

- (instancetype)initWithCoder:(NSCoder *)encoder
{
    self = [super init];
    if (self) {
        [self setRadianos:[encoder decodeFloatForKey:@"radianos"]];
        [self setValorCentral:[encoder decodeCGPointForKey:@"centro"]];
        [self setCorCirculo:[encoder decodeObjectForKey:@"corCirculo"] ];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)decoder
{
    
    [decoder encodeFloat:_radianos forKey:@"radianos"];
    [decoder encodeCGPoint:_valorCentral forKey:@"centro"];
    [decoder encodeObject:_corCirculo forKey:@"corCirculo"];
    
}

-(BOOL)havePoint:(CGPoint)point{
    
    for(float t = 0.0;t < 1.0; t+=0.5){
        float x = self.valorCentral.x + t * (self.valorCentral.x - self.valorCentral.x);
        float y = self.valorCentral.y + t * (self.valorCentral.y - self.valorCentral.y);
        
        if(hypot(x - point.x, y - point.y) < 20.0){
            return YES;
        }
    }
    
    return NO;
}
@end
