//
//  drawElipse.m
//  Desafio021905
//
//  Created by Luís Resende on 20/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "drawElipse.h"

@implementation drawElipse

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor (context, self.color.CGColor);
    CGContextFillEllipseInRect(context, rect);
    CGContextStrokePath(context);
}


@end
