//
//  DesenhoViewController.m
//  Desafio021905
//
//  Created by Luís Resende on 19/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "DesenhoViewController.h"

@interface DesenhoViewController ()

@end

@implementation DesenhoViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
[self dismissViewControllerAnimated:YES completion:nil];

}
@end
