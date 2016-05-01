//
//  AlfaViewController.m
//  Desafio2
//
//  Created by Luís Resende on 20/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "AlfaViewController.h"

@interface AlfaViewController ()

@end

@implementation AlfaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)goToBeta:(id)sender
{
    UIStoryboard *storyb = [UIStoryboard storyboardWithName:@"Beta" bundle:nil];
    UIViewController *viewController = [storyb instantiateInitialViewController];
    viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
