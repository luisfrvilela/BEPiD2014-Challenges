//
//  AlugarViewController.m
//  Desafio2_1407
//
//  Created by Luís Resende on 18/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "AlugarViewController.h"
#import "SegundaViewController.h"
#import "Carro.h"
@interface AlugarViewController ()

@end

@implementation AlugarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.dataFim setMinimumDate:[NSDate date]];
    
    self.carroDicionario = [[Carro sharedCarros]obterSharedCarros][i];
    
}

- (instancetype)init:(int)j
{
    self = [super init];
    if (self) {
        
    }
    i = j;
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alugaCarro:(id)sender {
    
    [self.carroDicionario setValue:@"Alugado" forKey:@"status"];
    
    [self.carroDicionario setValue:[NSDate date] forKey:@"dataInicio"];
    
    NSDate *date = [_dataFim date];
    
    [self.carroDicionario setValue:date forKey:@"dataFim"];
    
    [[Carro sharedCarros]setarSharedCarros:self.carroDicionario :i];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
