//
//  AppDelegate.h
//  Desafio022205
//
//  Created by Luís Resende on 22/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrincipalViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UIScrollView *scroolView;
@property (nonatomic) PrincipalViewController *principal;

@end
