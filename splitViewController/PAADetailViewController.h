//
//  PAADetailViewController.h
//  splitViewController
//
//  Created by Luís Resende on 16/09/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PAAItem;

@interface PAADetailViewController : UIViewController <UITextFieldDelegate, UISplitViewControllerDelegate>

@property (nonatomic) PAAItem *item;
-(instancetype)initWithItem: (PAAItem*)objeto;
@end
