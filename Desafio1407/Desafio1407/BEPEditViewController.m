//
//  BEPEditViewController.m
//  Desafio1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "BEPEditViewController.h"
#import "BEPNome.h"
@interface BEPEditViewController ()

@end

@implementation BEPEditViewController

-(id) init {
    self = [super init];
    
    if(self){
        UINavigationItem *navEditItem = self.navigationItem;
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(editDone:)];
        
        navEditItem.rightBarButtonItem = doneButton;
    }
    return self;
}

-(IBAction)editDone:(id)sender{
    [[BEPNome sharedNome] setarSharedNome:self.campoNome.text];
    [[BEPNome sharedNome] setarSharedIdade:[self.campoIdade.text intValue]];
    [[BEPNome sharedNome] setarSharedAltura:[self.campoAltura.text floatValue]];
    [[BEPNome sharedNome] setarSharedPeso:[self.campoPeso.text floatValue]];
    
    [self.navigationController popViewControllerAnimated:YES];
}

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    self.campoNome.text = [[BEPNome sharedNome]obterSharedNome];
    self.campoIdade.text = [NSString stringWithFormat:@"%d",[[BEPNome sharedNome] obterSharedIdade]];
    self.campoAltura.text = [NSString stringWithFormat:@"%.2f",[[BEPNome sharedNome] obterSharedAltura]];
    self.campoPeso.text = [NSString stringWithFormat:@"%.2f",[[BEPNome sharedNome] obterSharedPeso]];
}
@end