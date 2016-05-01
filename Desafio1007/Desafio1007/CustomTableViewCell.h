//
//  CustomTableViewCell.h
//  Desafio1007
//
//  Created by Luís Resende on 10/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *customPrimeiroNome;
@property (weak, nonatomic) IBOutlet UILabel *customSegundoNome;
@property (weak, nonatomic) IBOutlet UIImageView *customImagem;

@end
