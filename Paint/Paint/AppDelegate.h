//
//  AppDelegate.h
//  Paint
//
//  Created by Luís Resende on 29/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) NSMutableArray *finishedLines;
@property (nonatomic) NSMutableArray *finishedCircles;

-(void)salvarLinhas;
-(void)carregarLinhas;

-(void)salvarCirculos;
-(void)carregarCirculos;
@end
