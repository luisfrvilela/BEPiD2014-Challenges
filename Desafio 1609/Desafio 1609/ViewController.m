//
//  ViewController.m
//  Desafio 1609
//
//  Created by Eduardo Alves on 16/09/14.
//  Copyright (c) 2014 Eduardo, Marco, Wgleyberton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (nonatomic) NSInteger success;
@end

@implementation ViewController

- (IBAction)entrar:(id)sender {
     _success = 0;
    
    @try {
        if ([[self.txtUsername text] isEqualToString:@""] || [[self.txtPassword text] isEqualToString:@""]) {
            [self alertStatus:@"Please enter Email and Password" :@"Sign in Failed!" :0];
        }else{
            NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@",[self.txtUsername text],[self.txtPassword text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url = [NSURL URLWithString:@"http://172.16.2.237:8888/jsonlogin.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            NSError *error = [[NSError alloc]init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSLog(@"Response code: %ld",(long)[response statusCode]);
            
            if([response statusCode] >= 200 && [response statusCode] < 300){
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                NSError *error = nil;
                NSDictionary *jsonData = [NSJSONSerialization
                                          JSONObjectWithData:urlData
                                          options:NSJSONReadingMutableContainers
                                          error:&error];
                
                _success = [jsonData[@"success"] integerValue];
                NSLog(@"Sucess: %ld",(long)_success);
                
                if(_success == 1){
                    NSLog(@"Login SUCCESS");
                }else{
                    NSString *error_msg = (NSString *) jsonData[@"error_message"];
                    [self alertStatus:error_msg :@"Sign in Failed!":0];
                }
            }else{
                //        if(error) NSLOG(@"Error: %@",error);
                [self alertStatus:@"Connection Failed" :@"Sign in Failed!":0];
            }
        }
    }
    @catch (NSException *e){
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed.":@"Error!":0];
    }
    if(_success){
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
}
#pragma mark - Alerta

-(void)alertStatus:(NSString *)msg :(NSString *)title :(int) tag{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                  message:msg
                                                  delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(_success == 1){
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
