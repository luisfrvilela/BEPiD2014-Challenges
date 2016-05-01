//
//  ViewController.m
//  WebService
//
//  Created by Luís Resende on 27/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import "ViewController.h"
#import "iOSRequest.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)fetchAddress: (NSString *)address
{
    NSLog(@"Carregando o endereco: %@",address);
    [iOSRequest requestToPath:address onCompletion:^(NSString *result, NSError *error){
        dispatch_async(dispatch_get_main_queue(), ^{
        
            if(error){
                [self stopFetching:@"Failed to Fetch"];
                NSLog(@"%@",error);
            }
            else{
                [self stopFetching:result];
            }
        });
        
    }];
    
}

-(IBAction)fetch:(id)sender
{
    [self startFetching];
    [self fetchAddress:self.addressField.text];
}

-(void)startFetching
{
    NSLog(@"Fetching");
    [self.addressField resignFirstResponder];
    [self.loading startAnimating];
    self.fetchButton.enabled = NO;
}

-(void)stopFetching: (NSString*)result
{
    NSLog(@"Done Fetching");
    self.outputLabel.text = result;
    [self.loading stopAnimating];
    self.fetchButton.enabled = YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
