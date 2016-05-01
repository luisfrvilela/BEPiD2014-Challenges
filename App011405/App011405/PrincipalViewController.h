//
//  PrincipalViewController.h
//  App011405
//
//  Created by Luís Resende on 14/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrincipalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UILabel *idade;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *universidade;
@property (weak, nonatomic) IBOutlet UITextField *curso;
@property (nonatomic) NSMutableArray *lista;

- (void) gravarDados;

@end
