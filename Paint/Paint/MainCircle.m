//
//  MainCircle.m
//  Paint
//
//  Created by Luís Resende on 31/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "MainCircle.h"

@implementation MainCircle

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeCGPoint:_centro forKey:@"centro"];
    [aCoder encodeFloat:_radianos forKey:@"radiano"];
    [aCoder encodeObject:_corCirculo forKey:@"corCirculo"];
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setCentro:[aDecoder decodeCGPointForKey:@"centro"]];
        [self setRadianos:[aDecoder decodeFloatForKey:@"radiano"]];
        [self setCorCirculo:[aDecoder decodeObjectForKey:@"corCirculo"]];
    }
    return self;
}

-(BOOL)havePoint:(CGPoint)point{
    
    for(float t = 0.0;t < 1.0; t+=0.5){
        float x = self.centro.x + t * (self.centro.x - self.centro.x);
        float y = self.centro.y + t * (self.centro.y - self.centro.y);
        
        if(hypot(x - point.x, y - point.y) < 20){
            return YES;
        }
    }
    
    return NO;
}

@end
