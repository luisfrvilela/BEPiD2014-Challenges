//
//  ViewController.m
//  teste2
//
//  Created by Luís Resende on 25/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property(nonatomic,assign)int counter;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTimerVida:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTimerVida: (int)segundos{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];    
    appDelegate.countDownTimerVida = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRunVida) userInfo:nil repeats:YES];
}

-(void)timerRunVida{
    NSLog(@"%d",self.counter++);
}


@end
