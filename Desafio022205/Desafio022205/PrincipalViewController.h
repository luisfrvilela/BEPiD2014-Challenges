//
//  PrincipalViewController.h
//  Desafio022205
//
//  Created by Luís Resende on 22/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrincipalViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *opcaoNumero;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numero;


- (IBAction)jogar:(UIButton *)sender;

@end
