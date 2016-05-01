//
//  AppDelegate.h
//  exemplo2907
//
//  Created by Rodrigo Von-Grapp Freitas on 29/07/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) NSMutableArray *endedLines;
@property (nonatomic) NSMutableArray *endedCircles;

-(void)saveLines;
-(void)loadLines;
-(void)saveCircles;
-(void)loadCircles;
@end
