//
//  BEPEditViewController.h
//  Desafio1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BEPEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *campoNome;
@property (weak, nonatomic) IBOutlet UITextField *campoIdade;
@property (weak, nonatomic) IBOutlet UITextField *campoAltura;
@property (weak, nonatomic) IBOutlet UITextField *campoPeso;

@end
