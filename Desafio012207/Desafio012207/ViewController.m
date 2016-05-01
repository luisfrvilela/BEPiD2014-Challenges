//
//  ViewController.m
//  Desafio012207
//
//  Created by Luís Resende on 22/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alterar:(id)sender {
    if (_redBoxHeightConstraint.constant > 50) {
        _redBoxHeightConstraint.constant = 50;
    }
    else
    {
        _redBoxHeightConstraint.constant = 120;
    }
}
@end
