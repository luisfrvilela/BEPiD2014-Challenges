//
//  ViewController.m
//  testeABC
//
//  Created by Luís Resende on 03/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    _botao1.tag = 10;
    _botao2.tag = 20;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)opcao1:(id)sender{
    NSLog(@"clicou %@",[sender currentTitle]);
    
    if([[sender currentTitle]isEqualToString:@"Button1"]){
        [sender setBackgroundColor:[UIColor greenColor]];
    }
    else{
    [sender setBackgroundColor:[UIColor redColor]];
    }
}

@end
