//
//  BPDView1.m
//  Aula2406
//
//  Created by Luís Resende on 24/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "BPDView1.h"

@implementation BPDView1

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
 CGRect firstFrame = CGRectMake(160, 240, 100, 150);
 BPDView1 *firstView = [[BPDView1 alloc]initWithFrame:firstFrame];
 firstView.backgroundColor = [UIColor redColor];
 [self.window addSubview:firstView];

}


@end
