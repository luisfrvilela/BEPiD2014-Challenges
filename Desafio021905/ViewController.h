//
//  ViewController.h
//  Desafio021905
//
//  Created by Luís Resende on 19/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel * coordenadaX;
@property (weak, nonatomic) IBOutlet UILabel * coordenadaY;
@property (weak, nonatomic) IBOutlet UITextField * altura;
@property (weak, nonatomic) IBOutlet UITextField * largura;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cor;


@end
