//
//  MainLine.h
//  Paint
//
//  Created by Luís Resende on 29/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainLine : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint endLine;

-(void)stroke;
- (BOOL) havePoint: (CGPoint)point;
@end
