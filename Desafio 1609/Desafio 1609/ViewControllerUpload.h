//
//  ViewControllerUpload.h
//  Desafio 1609
//
//  Created by Eduardo Alves on 17/09/14.
//  Copyright (c) 2014 Eduardo, Marco, Wgleyberton. All rights reserved.
//

#import "ViewController.h"

@interface ViewControllerUpload : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
    IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *lblProcessado;
}

-(IBAction)pushPick:(id)sender;
-(IBAction)pushUpload:(id)sender;

@end
