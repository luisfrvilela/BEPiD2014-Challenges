//
//  ViewController.m
//  Desafio021905
//
//  Created by Luís Resende on 19/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "ViewController.h"
#import "DesenhoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)mexeuSliderX:(id)sender
{
    [self.coordenadaX setText:[NSString stringWithFormat:@"%d" , (int)((UISlider *)sender).value]];
}

- (IBAction)mexeuSliderY:(id)sender
{
    [self.coordenadaY setText:[NSString stringWithFormat:@"%d" , (int)((UISlider *)sender).value]];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.coordenadaX resignFirstResponder];
    [self.coordenadaY resignFirstResponder];
    [self.altura resignFirstResponder];
    [self.largura resignFirstResponder];
    [self.cor resignFirstResponder];
}

-(IBAction)desenhar:(id)sender
{
    
    CGRect firstFrame = CGRectMake([_coordenadaX.text floatValue],[_coordenadaY.text floatValue], [_largura.text floatValue], [_altura.text floatValue]);
   
    UIView * retanguloView = [[UIView alloc]initWithFrame:firstFrame];

    DesenhoViewController *desenho = [[DesenhoViewController alloc]init];
    
    if(_cor.selectedSegmentIndex == 0){
        retanguloView.backgroundColor = [UIColor greenColor];
    }
    
    else if (_cor.selectedSegmentIndex == 1){
        retanguloView.backgroundColor = [UIColor yellowColor];
    }
    else if (_cor.selectedSegmentIndex == 2){
        retanguloView.backgroundColor = [UIColor blueColor];
    }
    else if (_cor.selectedSegmentIndex == 3){
        retanguloView.backgroundColor = [UIColor redColor];
    }
    else {
        retanguloView.backgroundColor = [UIColor blackColor];
    }
    
    [desenho.view addSubview:retanguloView];

    [self presentViewController:desenho animated:YES completion:nil];

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
