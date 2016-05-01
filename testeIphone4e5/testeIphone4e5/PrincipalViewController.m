//
//  PrincipalViewController.m
//  testeIphone4e5
//
//  Created by Luís Resende on 25/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "PrincipalViewController.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 )
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
    if (IS_IPHONE_5)){
        self.view.frame=CGRectMake(0, 460, 100, 70);
        self.view.frame=CGRectMake(150, 460, 100, 70);
    }
    else {
        self.view.frame=CGRectMake(0, 360, 100, 70);
        self.view.frame=CGRectMake(150, 360, 100, 70);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botao:(id)sender {
}

- (id)initWithNibNameforIphone4:(NSString *)nibNameOrNil4 NibNameforIphone5:(NSString *)nibNameOrNil5 NibNameforIpad:(NSString *)nibNameOrNilpad bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super init])
    {
        self = [self initWithNibName:[self CheckDeviceIphone4:nibNameOrNil4 Iphone5:nibNameOrNil5 Ipad:nibNameOrNilpad] bundle:nibBundleOrNil];
    }
    return self;
    
}

-(NSString *)CheckDeviceIphone4:(NSString *)iphone4 Iphone5:(NSString *)iphone5 Ipad:(NSString *)ipad {
    
    return ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) ? ipad :([[UIScreen mainScreen] bounds].size.height == 568) ?  iphone5 : iphone4;
}

@end
