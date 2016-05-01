//
//  MainLine.m
//  exemplo2907
//
//  Created by Rodrigo Von-Grapp Freitas on 29/07/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import "MainLine.h"

@implementation MainLine


-(void)stroke{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:self.begin];
    [bp addLineToPoint:self.end];
    [bp stroke];
}

- (instancetype)initWithCoder:(NSCoder *)encoder
{
    self = [super init];
    if (self) {
        _begin = [encoder decodeCGPointForKey:@"begin"];
        _end = [encoder decodeCGPointForKey:@"end"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)decoder
{
    
    [decoder encodeCGPoint:_begin forKey:@"begin"];
    [decoder encodeCGPoint:_end forKey:@"end"];
    
}
-(BOOL)havePoint:(CGPoint)point{
    
    for(float t = 0.0;t < 1.0; t+=0.5){
        float x = self.begin.x + t * (self.end.x - self.begin.x);
        float y = self.begin.y + t * (self.end.y - self.begin.y);
        
        if(hypot(x - point.x, y - point.y) < 20.0){
            return YES;
        }
    }
    
    return NO;
}
@end
