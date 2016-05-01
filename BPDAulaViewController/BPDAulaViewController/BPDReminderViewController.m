//
//  BPDReminderViewController.m
//  BPDAulaViewController
//
//  Created by Luís Resende on 24/06/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "BPDReminderViewController.h"

@interface BPDReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation BPDReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@",date);
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"Alert1";
    note.fireDate = date;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:note];
    
}

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        UITabBarItem *tbi = self.tabBarItem;
        tbi.title = @"Reminder";
        UIImage *i = [UIImage imageNamed:@"fig1.png"];
        tbi.image = i;
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BPDReminderViewController carregou a view");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
