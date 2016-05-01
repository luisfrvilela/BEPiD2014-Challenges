//
//  drawElipse.m
//  Desafio042005
//
//  Created by Luís Resende on 21/05/14.
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
    CGContextSetAlpha(context, 1);
    CGContextSetFillColorWithColor (context, [UIColor redColor].CGColor);
    CGContextFillEllipseInRect(context, rect);

}


@end
