//
//  ViewController.h
//  WebServiceExemplo
//
//  Created by Luís Resende on 22/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usuario;
@property (weak, nonatomic) IBOutlet UITextField *senha;
- (IBAction)enviar:(id)sender;


@end

