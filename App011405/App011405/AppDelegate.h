//
//  AppDelegate.h
//  App011405
//
//  Created by Luís Resende on 14/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrincipalViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(strong, nonatomic) PrincipalViewController *principal;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
