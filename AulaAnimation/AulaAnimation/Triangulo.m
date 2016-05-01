//
//  Triangulo.m
//  AulaAnimation
//
//  Created by Luís Resende on 31/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "Triangulo.h"

@implementation Triangulo


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));  // top left
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMidY(rect));  // mid right
    CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
    CGContextClosePath(ctx);
    
    CGContextSetFillColorWithColor(ctx, _cor.CGColor);
    CGContextFillPath(ctx);
}

@end
