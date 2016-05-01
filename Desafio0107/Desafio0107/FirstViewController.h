//
//  FirstViewController.h
//  Desafio0107
//
//  Created by Luís Resende on 01/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textNome;
@property (weak, nonatomic) IBOutlet UITextField *textCPF;
@property (weak, nonatomic) IBOutlet UITextField *textTelefone;
@property (weak, nonatomic) IBOutlet UITextField *textSenha;

@property (nonatomic) NSMutableArray *informacoesPessoa;

@property (nonatomic) UIAlertView *alerta1;
@property (nonatomic) UIAlertView *alerta2;

- (IBAction)enviar:(id)sender;

@end
