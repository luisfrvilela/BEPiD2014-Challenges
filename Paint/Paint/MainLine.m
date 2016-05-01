//
//  MainLine.m
//  Paint
//
//  Created by Luís Resende on 29/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "MainLine.h"

@implementation MainLine

-(void)stroke{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:self.begin];
    [bp addLineToPoint:self.endLine];
    [bp stroke];
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _begin = [coder decodeCGPointForKey:@"begin"];
        _endLine = [coder decodeCGPointForKey:@"end"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    
    [coder encodeCGPoint:_begin forKey:@"begin"];
    [coder encodeCGPoint:_endLine forKey:@"end"];
    
}

-(BOOL)havePoint:(CGPoint)point{
    
    for(float t = 0.0;t < 1.0; t+=0.5){
        float x = self.begin.x + t * (self.endLine.x - self.begin.x);
        float y = self.begin.y + t * (self.endLine.y - self.begin.y);
        
        if(hypot(x - point.x, y - point.y) < 20){
            return YES;
        }
    }
    
    return NO;
}
@end
