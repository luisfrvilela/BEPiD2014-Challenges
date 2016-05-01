//
//  PrincipalViewController.m
//  ScrollTeste
//
//  Created by Luís Resende on 07/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()

@end

@implementation PrincipalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.minhaScroll setScrollEnabled:YES];
    [self.minhaScroll setContentSize:CGSizeMake(320, 800)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
