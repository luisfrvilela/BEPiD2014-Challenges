//
//  PrimeiraViewController.h
//  Exercicio1
//
//  Created by Teste on 28/03/14.
//  Copyright (c) 2014 Exercicio1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrimeiraViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UILabel *labelModify;
    IBOutlet UITextField *primeiroNome;
    IBOutlet UITextField *sobreNome;
}
- (IBAction)buttonAction:(id)sender;
- (void)didReceiveMemoryWarning;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@end
