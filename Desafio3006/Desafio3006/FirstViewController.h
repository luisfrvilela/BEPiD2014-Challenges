//
//  FirstViewController.h
//  Desafio3006
//
//  Created by Luís Resende on 30/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIScrollViewDelegate, UIAlertViewDelegate>

@property (nonatomic) UIScrollView *primeiroScroll;
@property (nonatomic) UIScrollView *segundoScroll;

@property(nonatomic) UIScrollView *terceiroScroll;
@property(nonatomic) UIAlertView *aviso;

@property (nonatomic)  UIButton *b1;
@property (nonatomic)  UIButton *b2;
@property (nonatomic)  UIButton *b3;
@property (nonatomic)  UIButton *b4;
@property (nonatomic)  UIButton *b5;
@property (nonatomic)  UIButton *b6;

@property (nonatomic)  UIButton *b7;
@property (nonatomic)  UIButton *b8;
@property (nonatomic)  UIButton *b9;
@property (nonatomic)  UIButton *b10;
@property (nonatomic)  UIButton *b11;
@property (nonatomic)  UIButton *b12;

@end
