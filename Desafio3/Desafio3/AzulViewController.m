//
//  AzulViewController.m
//  Desafio3
//
//  Created by Luís Resende on 22/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "AzulViewController.h"

@interface AzulViewController ()

@end

@implementation AzulViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    self.texto.text = _text;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier]isEqualToString:@"VaiProVerde"]) {
        [[segue destinationViewController] setText:@"VaiProVerde"];
    }
    else if ([[segue identifier]isEqualToString:@"VaiProAmarelo"]) {
        [[segue destinationViewController] setText:@"VaiProAmarelo"];
    }
    else{
        [[segue destinationViewController] setText:@"VaiProAzul"];
    }
    
    
}

@end
