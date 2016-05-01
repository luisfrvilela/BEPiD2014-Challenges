//
//  CadastroViewController.m
//  App011405
//
//  Created by Luís Resende on 14/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "CadastroViewController.h"

@interface CadastroViewController ()

@end

@implementation CadastroViewController
- (IBAction)ok:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

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

@end
