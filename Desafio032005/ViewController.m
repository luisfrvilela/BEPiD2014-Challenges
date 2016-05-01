//
//  ViewController.m
//  Desafio021905
//
//  Created by Luís Resende on 19/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "ViewController.h"
#import "DesenhoViewController.h"
#import "drawElipse.h"


@interface ViewController ()

@end

DesenhoViewController *desenho = nil;

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
    
    UIColor *color;
    
    if(!desenho){
    desenho = [[DesenhoViewController alloc]init];
    }
    
    CGRect retangulo = CGRectMake([_coordenadaX.text floatValue], [_coordenadaY.text floatValue], [_largura.text floatValue], [_altura.text floatValue]);
   
    if(_cor.selectedSegmentIndex == 0){
        color = [UIColor greenColor];
    }
    
    else if (_cor.selectedSegmentIndex == 1){
        color = [UIColor yellowColor];
    }
    else if (_cor.selectedSegmentIndex == 2){
        color = [UIColor blueColor];
    }
    else if (_cor.selectedSegmentIndex == 3){
        color = [UIColor redColor];
    }
    else {
        color = [UIColor blackColor];
    }
    
    if(_forma.selectedSegmentIndex == 0){
        
        UIView * retanguloView = [[UIView alloc]initWithFrame:retangulo];
        retanguloView.backgroundColor = color;
        [desenho.view addSubview:retanguloView];
   
    }
    else{
        
    
    drawElipse *elipse = [[drawElipse alloc]initWithFrame:retangulo];
    
    elipse.color = color;
    elipse.backgroundColor = [UIColor clearColor];
    
    [desenho.view addSubview:elipse];
   
    }

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
