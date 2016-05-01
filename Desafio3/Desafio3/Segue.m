//
//  Segue.m
//  Desafio3
//
//  Created by Luís Resende on 22/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "Segue.h"

@implementation Segue

-(void)perform{
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromBottom
                     animations:^{
                         // Grow!
                         destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview]; // remove from temp super view
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL]; // present VC
                     }];
}

@end
