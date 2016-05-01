//
//  ViewController.h
//  WebService
//
//  Created by Luís Resende on 27/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UIButton *fetchButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;


@end
