//
//  ViewController.m
//  AulaAnimation
//
//  Created by Luís Resende on 27/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _angle = 180;
    //   CGRect desenhoTotal = CGRectMake(60,184,200,200);
    CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI/180);
    CGRect desenho1 = CGRectMake(60,184,100,200);
    CGRect desenho2 = CGRectMake(110,134,100,200);
    CGRect desenho3 = CGRectMake(62,332,150,50);
    CGRect desenho4 = CGRectMake(135,259,50,100);
    CGRect desenho5 = CGRectMake(175,249,71,71);
    CGRect desenho6 = CGRectMake(210,184,50,100);
    CGRect desenho7 = CGRectMake(200,287,70,140);
    
    //Desenha o triangulo 1;
    _triangulo1 = [[Triangulo alloc]initWithFrame:desenho1];
    _triangulo1.backgroundColor = [UIColor clearColor];
    _triangulo1.cor = [UIColor greenColor];
    [self.view addSubview:_triangulo1];
    
    //Desenha o triangulo 2;
    _triangulo2 = [[Triangulo alloc]initWithFrame:desenho2];
    _triangulo2.backgroundColor = [UIColor clearColor];
    _triangulo2.cor = [UIColor grayColor];
    rotate = CGAffineTransformMakeRotation(90 * M_PI/180);
    _triangulo2.transform = rotate;
    [self.view addSubview:_triangulo2];
    
    //Desenha o Paralelogramo 3;
    _paralelogramo = [[Paralelogramo alloc]initWithFrame:desenho3];
    _paralelogramo.backgroundColor = [UIColor clearColor];
    _paralelogramo.cor = [UIColor redColor];
    //   rotate = CGAffineTransformMakeRotation(90 * M_PI/180);
    //   _paralelogramo.transform = rotate;
    [self.view addSubview:_paralelogramo];
    
    //Desenha o triangulo 4;
    _triangulo4 = [[Triangulo alloc]initWithFrame:desenho4];
    _triangulo4.backgroundColor = [UIColor clearColor];
    _triangulo4.cor = [UIColor purpleColor];
    rotate = CGAffineTransformMakeRotation(-90 * M_PI/180);
    _triangulo4.transform = rotate;
    [self.view addSubview:_triangulo4];
    
    //Desenha o quadrado 5;
    _quadrado = [[UIView alloc]initWithFrame:desenho5];
    _quadrado.backgroundColor = [UIColor yellowColor];
    rotate = CGAffineTransformMakeRotation(45 * M_PI/180);
    _quadrado.transform = rotate;
    [self.view addSubview:_quadrado];
    
    //Desenha o triangulo 6;
    _triangulo6 = [[Triangulo alloc]initWithFrame:desenho6];
    _triangulo6.backgroundColor = [UIColor clearColor];
    _triangulo6.cor = [UIColor brownColor];
    rotate = CGAffineTransformMakeRotation(180 * M_PI/180);
    _triangulo6.transform = rotate;
    [self.view addSubview:_triangulo6];
    
    //Desenha o triangulo 7;
    _triangulo7 = [[Triangulo alloc]initWithFrame:desenho7];
    _triangulo7.backgroundColor = [UIColor clearColor];
    _triangulo7.cor = [UIColor blueColor];
    rotate = CGAffineTransformMakeRotation(45 * M_PI/180);
    _triangulo7.transform = rotate;
    [self.view addSubview:_triangulo7];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.delaysTouchesBegan = YES;
    [self.view addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    tap.delaysTouchesBegan = YES;
    [tap requireGestureRecognizerToFail:doubleTap];
    [self.view addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self  action:@selector(longPress)];
    [self.view addGestureRecognizer:longPress];
    
}

-(void)tap{
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        CGAffineTransform rotate;
        
        //Atualiza triangulos grandes 1 e 2
        
        rotate = CGAffineTransformMakeRotation(-M_PI/2);
        _triangulo1.transform = rotate;
        _triangulo1.center = CGPointMake(100,250);
        
        rotate = CGAffineTransformMakeRotation(-M_PI/2);
        _triangulo2.transform = rotate;
        _triangulo2.center = CGPointMake(300,250);
        
        //Atualiza triangulos pequenos 6 e 4
        
        rotate = CGAffineTransformMakeRotation(M_PI);
        _triangulo6.transform = rotate;
        _triangulo6.center = CGPointMake(175, 150);
        
        rotate = CGAffineTransformMakeRotation(M_PI/2);
        _triangulo4.transform = rotate;
        _triangulo4.center = CGPointMake(200, 275);
        
        //Atualiza triagulo médio 7
        
        rotate = CGAffineTransformMakeRotation(135*M_PI/180);
        _triangulo7.transform = rotate;
        _triangulo7.center = CGPointMake(225, 175);
        
        //Atualiza quadrado
        
        rotate = CGAffineTransformMakeRotation(-M_PI/4);
        _quadrado.transform = rotate;
        _quadrado.center = CGPointMake(150, 200);
        
        //Atualiza paralelogramo
        
        rotate = CGAffineTransformMakeRotation(0);
        _paralelogramo.transform = rotate;
        _paralelogramo.center = CGPointMake(225, 225);
        
    } completion:nil];
}

-(void)doubleTap{
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        CGAffineTransform rotate;
        
        //Atualiza triangulos grandes 1 e 2
        
        rotate = CGAffineTransformMakeRotation(-90*M_PI/180);
        _triangulo1.transform = rotate;
        _triangulo1.center = CGPointMake(250+50,185);
        
        rotate = CGAffineTransformMakeRotation(-M_PI/1024);
        _triangulo2.transform = rotate;
        _triangulo2.center = CGPointMake(250,135);
        
        //Atualiza triangulos pequenos 6 e 4
        
        rotate = CGAffineTransformMakeRotation(45*M_PI/180);
        _triangulo6.transform = rotate;
        _triangulo6.center = CGPointMake(168, 147);
        
        rotate = CGAffineTransformMakeRotation(45*M_PI/180);
        _triangulo4.transform = rotate;
        _triangulo4.center = CGPointMake(97, 218);
        
        //Atualiza triagulo médio 7
        
        rotate = CGAffineTransformMakeRotation(90*M_PI/180);
        _triangulo7.transform = rotate;
        _triangulo7.center = CGPointMake(245, 275);
        
        //Atualiza quadrado
        
        rotate = CGAffineTransformMakeRotation(M_PI);
        _quadrado.transform = rotate;
        _quadrado.center = CGPointMake(150, 200);
        
        //Atualiza paralelogramo
        
        rotate = CGAffineTransformMakeRotation(45*M_PI/180);
        _paralelogramo.transform = rotate;
        _paralelogramo.center = CGPointMake(175, 275);
        
    } completion:nil];
}

-(void)longPress{
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        CGAffineTransform rotate;
        
        //Atualiza triangulos grandes 1 e 2
        
        rotate = CGAffineTransformMakeRotation(0);
        _triangulo1.transform = rotate;
        _triangulo1.center = CGPointMake(150,200);
        
        rotate = CGAffineTransformMakeRotation(M_PI/2);
        _triangulo2.transform = rotate;
        _triangulo2.center = CGPointMake(200,150);
        
        //Atualiza triangulos pequenos 6 e 4
        
        rotate = CGAffineTransformMakeRotation(M_PI);
        _triangulo6.transform = rotate;
        _triangulo6.center = CGPointMake(275, 150);
        
        rotate = CGAffineTransformMakeRotation(-M_PI/2);
        _triangulo4.transform = rotate;
        _triangulo4.center = CGPointMake(200, 225);
        
        //Atualiza triagulo médio 7
        
        rotate = CGAffineTransformMakeRotation(45*M_PI/180);
        _triangulo7.transform = rotate;
        _triangulo7.center = CGPointMake(275, 275);
        
        //Atualiza quadrado
        
        rotate = CGAffineTransformMakeRotation(M_PI/4);
        _quadrado.transform = rotate;
        _quadrado.center = CGPointMake(250, 200);
        
        //Atualiza paralelogramo
        
        rotate = CGAffineTransformMakeRotation(0);
        _paralelogramo.transform = rotate;
        _paralelogramo.center = CGPointMake(175, 275);
        
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end