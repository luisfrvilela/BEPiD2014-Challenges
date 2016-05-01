//
//  AppDelegate.m
//  exemplo2907
//
//  Created by Rodrigo Von-Grapp Freitas on 29/07/14.
//  Copyright (c) 2014 Rodrigo Freitas. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MainLine.h"
#import "MainCircle.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MainViewController *main = [[MainViewController alloc]init];
    
    _endedLines = [[NSMutableArray alloc]init];
    _endedCircles = [[NSMutableArray alloc]init];
    
    self.window.rootViewController = main;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self loadLines];
    [self loadCircles];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:
    [self saveLines];
    [self saveCircles];
    
}
-(void)saveLines{
    
    NSFileManager *file = [NSFileManager defaultManager];
    NSError *erro;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistCaminho = [docDirectory stringByAppendingString:@"/retas.plist"];
    
    if ([file fileExistsAtPath:plistCaminho ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"retas" ofType:@"plist"];
        [file copyItemAtPath:resourcePath toPath:plistCaminho error:&erro];
    }
    
    NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistCaminho];
    
    for (MainLine *line in _endedLines) {
        NSData *element = [NSKeyedArchiver archivedDataWithRootObject:line];
        [stock addObject:element];
    }
    [stock writeToFile:plistCaminho atomically:YES];
}


-(void)loadLines{
    
    NSFileManager *file = [NSFileManager defaultManager];
    NSError *erro;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistCaminho = [docDirectory stringByAppendingString:@"/retas.plist"];
    
    if ([file fileExistsAtPath:plistCaminho ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"retas" ofType:@"plist"];
        [file copyItemAtPath:resourcePath toPath:plistCaminho error:&erro];
    }
    
    NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistCaminho];
    
    NSMutableArray *linhas = [[NSMutableArray alloc]init];
    
    for (NSData *element in stock) {
        MainLine *line = [NSKeyedUnarchiver unarchiveObjectWithData:element];
        [linhas addObject:line];
    }
    
    _endedLines = linhas;
}
-(void)saveCircles{
    
    NSFileManager *file = [NSFileManager defaultManager];
    NSError *erro;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistCaminho = [docDirectory stringByAppendingString:@"/circulos.plist"];
    
    if ([file fileExistsAtPath:plistCaminho ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"circulos" ofType:@"plist"];
        [file copyItemAtPath:resourcePath toPath:plistCaminho error:&erro];
    }
    
    NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistCaminho];
    
    for (MainCircle *circle in _endedCircles) {
        NSData *element = [NSKeyedArchiver archivedDataWithRootObject:circle];
        [stock addObject:element];
    }
    [stock writeToFile:plistCaminho atomically:YES];
}


-(void)loadCircles{
    
    NSFileManager *file = [NSFileManager defaultManager];
    NSError *erro;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistCaminho = [docDirectory stringByAppendingString:@"/circulos.plist"];
    
    if ([file fileExistsAtPath:plistCaminho ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"circulos" ofType:@"plist"];
        [file copyItemAtPath:resourcePath toPath:plistCaminho error:&erro];
    }
    
    NSMutableArray *stock = [NSMutableArray arrayWithContentsOfFile:plistCaminho];
    
    NSMutableArray *circles = [[NSMutableArray alloc]init];
    
    for (NSData *element in stock) {
        MainCircle *circle = [NSKeyedUnarchiver unarchiveObjectWithData:element];
        [circles addObject:circle];
    }
    
    _endedCircles = circles;
}
@end
