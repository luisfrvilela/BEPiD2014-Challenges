//
//  AlugarViewController.h
//  Desafio2_1407
//
//  Created by Luís Resende on 18/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlugarViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *dataFim;
@property (nonatomic) NSDictionary *carroDicionario;

- (IBAction)alugaCarro:(id)sender;
- (instancetype)init:(int)j;
@end
