//
//  DesenhoJapao.m
//  Desafio042005
//
//  Created by Luís Resende on 21/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "DesenhoJapao.h"

@implementation DesenhoJapao

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
    rect = CGRectMake(20, 100, 280, 150);
    UIView * retanguloView = [[UIView alloc]initWithFrame:rect];
    retanguloView.backgroundColor = [UIColor whiteColor];
    CGContextAddRect(context, rect);
    CGContextStrokePath(context);

}


@end
