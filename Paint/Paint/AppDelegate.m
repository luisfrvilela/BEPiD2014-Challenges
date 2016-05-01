//
//  AppDelegate.m
//  Paint
//
//  Created by Luís Resende on 29/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MainLine.h"
#import "MainCircle.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _finishedLines = [[NSMutableArray alloc]init];
    _finishedCircles = [[NSMutableArray alloc]init];
    
    MainViewController *m = [[MainViewController alloc]init];
    
    self.window.rootViewController = m;
    
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
    [self carregarLinhas];
    [self carregarCirculos];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self salvarLinhas];
    [self salvarCirculos];
}

-(void)salvarLinhas{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistPath = [documentsDirectory stringByAppendingString:@"/linhas.plist"];
    
    if ([fileManager fileExistsAtPath:plistPath ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"linhas" ofType:@"plist"];
        [fileManager copyItemAtPath:resourcePath toPath:plistPath error:&error];
    }
    
    NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
    for (MainLine *line in _finishedLines) {
        NSData *element = [NSKeyedArchiver archivedDataWithRootObject:line];
        [stock addObject:element];
    }
    
    [stock writeToFile:plistPath atomically:YES];
}


-(void)carregarLinhas{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistPath = [documentsDirectory stringByAppendingString:@"/linhas.plist"];
    
    if ([fileManager fileExistsAtPath:plistPath ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"linhas" ofType:@"plist"];
        [fileManager copyItemAtPath:resourcePath toPath:plistPath error:&error];
    }
    
    NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
    NSMutableArray *linhas = [[NSMutableArray alloc]init];
    
    for (NSData *element in stock) {
        MainLine *line = [NSKeyedUnarchiver unarchiveObjectWithData:element];
        [linhas addObject:line];
    }
    
    _finishedLines = linhas;
}

-(void)salvarCirculos{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistPath = [documentsDirectory stringByAppendingString:@"/circulos.plist"];
    
    if ([fileManager fileExistsAtPath:plistPath ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"circulos" ofType:@"plist"];
        [fileManager copyItemAtPath:resourcePath toPath:plistPath error:&error];
    }
    
    NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
    for (MainCircle *circle in _finishedCircles) {
        NSData *element = [NSKeyedArchiver archivedDataWithRootObject:circle];
        [stock addObject:element];
    }
    NSLog(@"%@",plistPath);
    [stock writeToFile:plistPath atomically:YES];
}

-(void)carregarCirculos{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *plistPath = [documentsDirectory stringByAppendingString:@"/circulos.plist"];
    
    if ([fileManager fileExistsAtPath:plistPath ] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"circulos" ofType:@"plist"];
        [fileManager copyItemAtPath:resourcePath toPath:plistPath error:&error];
    }
    
    NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
    NSMutableArray *circulos = [[NSMutableArray alloc]init];
    
    for (NSData *element in stock) {
        MainCircle *circle = [NSKeyedUnarchiver unarchiveObjectWithData:element];
        [circulos addObject:circle];
    }
    
    _finishedCircles = circulos;
}

@end
