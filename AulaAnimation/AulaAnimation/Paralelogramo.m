//
//  Paralelogramo.m
//  AulaAnimation
//
//  Created by Luís Resende on 31/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "Paralelogramo.h"

@implementation Paralelogramo


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 
 CGContextBeginPath(ctx);
 CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));
 CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect)/3, CGRectGetMinY(rect));
 CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect));
 CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect)*2/3, CGRectGetMaxY(rect));
 CGContextClosePath(ctx);
 CGContextSetFillColorWithColor(ctx, _cor.CGColor);
 
 CGContextFillPath(ctx);
 
 }


@end
