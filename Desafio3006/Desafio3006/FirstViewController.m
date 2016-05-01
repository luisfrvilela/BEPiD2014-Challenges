//
//  FirstViewController.m
//  Desafio3006
//
//  Created by Luís Resende on 30/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.primeiroScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*2, self.view.bounds.size.height/2)];
        self.primeiroScroll.backgroundColor = [UIColor greenColor];
        [self.primeiroScroll setContentSize:CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height/2)];
        self.segundoScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height/2, self.view.bounds.size.width*2, self.view.bounds.size.height/2)];
        self.segundoScroll.backgroundColor = [UIColor blueColor];
        [self.segundoScroll setContentSize:CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height/2)];
        
        
        
        self.b1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 50, 200)];
        self.b1.backgroundColor = [UIColor grayColor];
        [_primeiroScroll addSubview:_b1];
        
        self.b2 = [[UIButton alloc]initWithFrame:CGRectMake(70, 10, 50, 200)];
        self.b2.backgroundColor = [UIColor grayColor];
        [_primeiroScroll addSubview:_b2];
        
        self.b3 = [[UIButton alloc]initWithFrame:CGRectMake(130, 10, 50, 200)];
        self.b3.backgroundColor = [UIColor grayColor];
        [_primeiroScroll addSubview:_b3];
        
        self.b4 = [[UIButton alloc]initWithFrame:CGRectMake(190, 10, 50, 200)];
        self.b4.backgroundColor = [UIColor grayColor];
        [_primeiroScroll addSubview:_b4];
        
        self.b5 = [[UIButton alloc]initWithFrame:CGRectMake(250, 10, 50, 200)];
        self.b5.backgroundColor = [UIColor grayColor];
        [_primeiroScroll addSubview:_b5];
        
        self.b6 = [[UIButton alloc]initWithFrame:CGRectMake(310, 10, 50, 200)];
        self.b6.backgroundColor = [UIColor grayColor];
        [_primeiroScroll addSubview:_b6];
        
        self.b7 = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 50, 200)];
        self.b7.backgroundColor = [UIColor grayColor];
        [_segundoScroll addSubview:_b7];
        
        self.b8 = [[UIButton alloc]initWithFrame:CGRectMake(70, 10, 50, 200)];
        self.b8.backgroundColor = [UIColor grayColor];
        [_segundoScroll addSubview:_b8];
        
        self.b9 = [[UIButton alloc]initWithFrame:CGRectMake(130, 10, 50, 200)];
        self.b9.backgroundColor = [UIColor grayColor];
        [_segundoScroll addSubview:_b9];
        
        self.b10 = [[UIButton alloc]initWithFrame:CGRectMake(190, 10, 50, 200)];
        self.b10.backgroundColor = [UIColor grayColor];
        [_segundoScroll addSubview:_b10];
        
        self.b11 = [[UIButton alloc]initWithFrame:CGRectMake(250, 10, 50, 200)];
        self.b11.backgroundColor = [UIColor grayColor];
        [_segundoScroll addSubview:_b11];
        
        self.b12 = [[UIButton alloc]initWithFrame:CGRectMake(310, 10, 50, 200)];
        self.b12.backgroundColor = [UIColor grayColor];
        [_segundoScroll addSubview:_b12];
        
        [self.view addSubview:_primeiroScroll];
        [self.view addSubview:_segundoScroll];
        _primeiroScroll.delegate = self;
        _segundoScroll.delegate = self;
        
        self.aviso = [[UIAlertView alloc]initWithTitle:@"Aumentar?" message:@"Deseja aumentar?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Aumentar", nil];
        
        [[self aviso] setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView == _primeiroScroll){
        NSLog(@"Mexeu Scrool Verde");
    }
    else{
        NSLog(@"Mexeu Scrool Azul");
    }
    [[self aviso]show];
    self.terceiroScroll = scrollView;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        NSLog(@"Cancelou");
    }else{
        NSLog(@"Aumentar");
        if(self.terceiroScroll == self.primeiroScroll){
            [[self primeiroScroll] setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*0.75)];
            [[self segundoScroll] setFrame:CGRectMake(0, self.view.bounds.size.height/4*3, self.view.bounds.size.width, (self.view.bounds.size.height*0.25))];
        }else{
            [[self primeiroScroll] setFrame:CGRectMake(0, 0, self.view.bounds.size.width, (self.view.bounds.size.height*0.25))];
            [[self segundoScroll] setFrame:CGRectMake(0, (self.view.bounds.size.height/2)/2, self.view.bounds.size.width, (self.view.bounds.size.height*0.75))];
        }
    }
}

@end
