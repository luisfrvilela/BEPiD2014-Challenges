//
//  ViewController.h
//  AulaAnimation
//
//  Created by Luís Resende on 27/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Triangulo.h"
#import "Paralelogramo.h"

@interface ViewController : UIViewController

@property (nonatomic) Triangulo *triangulo1;
@property (nonatomic) Triangulo *triangulo2;
@property (nonatomic) Paralelogramo *paralelogramo;
@property (nonatomic) Triangulo *triangulo4;
@property (nonatomic) UIView *quadrado;
@property (nonatomic) Triangulo *triangulo6;
@property (nonatomic) Triangulo *triangulo7;
@property (nonatomic) CGFloat scaleFactor;
@property (nonatomic) CGFloat angle;

@end

