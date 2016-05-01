//
//  ViewController.h
//  Desafio012207
//
//  Created by Luís Resende on 22/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redBoxHeightConstraint;

- (IBAction)alterar:(id)sender;
@end
