//
//  ViewControllerImagem.h
//  Desafio 1609
//
//  Created by Eduardo Alves on 18/09/14.
//  Copyright (c) 2014 Eduardo, Marco, Wgleyberton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerImagem : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
    IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *lblProcessado;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic)__weak IBOutlet UILabel *lblProcessado;

-(IBAction)pushPick:(id)sender;
-(IBAction)pushUpload:(id)sender;

@end
