//
//  AppDelegate.h
//  Desafio021905
//
//  Created by Luís Resende on 19/05/14.
//  Copyright (c) 2014 Luís Resende. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic) ViewController *principal;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
