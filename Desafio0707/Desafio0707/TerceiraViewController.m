//
//  TerceiraViewController.m
//  Desafio0707
//
//  Created by Luís Resende on 07/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "TerceiraViewController.h"

@interface TerceiraViewController ()

@end

@implementation TerceiraViewController

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
    UILabel *titulo = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 300, 100)];
    titulo.text = @"Terceira View";
    
    UIImage *imagem = [UIImage imageNamed:@"3.png"];
    
    UIImageView *imagemView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    
    imagemView.image = imagem;
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:imagemView];
    [self.view addSubview:titulo];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
