//
//  BPDViewController1.m
//  BPDAulaViewController
//
//  Created by Luís Resende on 24/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "BPDViewController1.h"
#import "BPDView1.h"

@implementation BPDViewController1

- (void) loadView{
    
    //Criar a view
    BPDView1 *firstView = [[BPDView1 alloc]init];
    firstView.backgroundColor = [UIColor redColor];
    
    //Setar com "a view" dessa view controller
    self.view = firstView;
    
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"View1";
        UIImage *i = [UIImage imageNamed:@"fig1.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BPDRViewController1 carregou a view");
}

@end
