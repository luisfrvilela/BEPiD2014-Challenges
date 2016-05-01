//
//  PAADetailViewController.m
//  splitViewController
//
//  Created by Luís Resende on 16/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "PAADetailViewController.h"
#import "PAAItem.h"

@interface PAADetailViewController () 

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation PAADetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(instancetype)initWithItem: (PAAItem*)objeto{
    self = [super init];
    if (self) {
        self.item = objeto;
        _nameField.delegate = self;
        _serialNumberField.delegate = self;
        _valueField.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.splitViewController.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [_nameField setText:self.item.itemName];
    [_serialNumberField setText:self.item.serialNumber];
    [_valueField setText:[NSString stringWithFormat:@"%d",self.item.value]];
    [_dateLabel setText:[NSString stringWithFormat:@"%@",self.item.dateCreated]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.item.itemName = _nameField.text;
    self.item.serialNumber = _serialNumberField.text;
    self.item.value = [_valueField.text intValue];
}
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
    NSLog(@"bbb");
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Itens" style:UIBarButtonItemStyleBordered target:self action:@selector(splitViewController:popoverController:willPresentViewController:)];
    self.navigationItem.leftBarButtonItem = item;
}
- (void)splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController{
    NSLog(@"ccc");
    
}
@end
