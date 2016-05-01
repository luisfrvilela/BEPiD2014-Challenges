//
//  BEPViewController.m
//  Desafio1407
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "BEPViewController.h"
#import "BEPEditViewController.h"
#import "BEPNome.h"
@interface BEPViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelNome;
@property (weak, nonatomic) IBOutlet UILabel *labelIdade;
@property (weak, nonatomic) IBOutlet UILabel *labelAltura;
@property (weak, nonatomic) IBOutlet UILabel *labelPeso;

@end

@implementation BEPViewController

-(id)init{
    self = [super init];
    
    if(self){
        UINavigationItem *navItem = self.navigationItem;
        
        UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(editNome:)];
        
        navItem.rightBarButtonItem = editButton;
    }
    return self;
}

-(IBAction)editNome:(id)sender{
    BEPEditViewController *editController = [[BEPEditViewController alloc]init];
    
    [self.navigationController pushViewController:editController animated:YES];
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

-(void)viewWillAppear:(BOOL)animated{
    self.labelNome.text = [[BEPNome sharedNome] obterSharedNome];
    self.labelIdade.text = [NSString stringWithFormat:@"%d",[[BEPNome sharedNome] obterSharedIdade]];
    self.labelAltura.text = [NSString stringWithFormat:@"%.2f",[[BEPNome sharedNome] obterSharedAltura]];
    self.labelPeso.text = [NSString stringWithFormat:@"%.2f",[[BEPNome sharedNome] obterSharedPeso]];
}
@end
