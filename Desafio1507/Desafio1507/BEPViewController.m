//
//  BEPViewController.m
//  Desafio1507
//
//  Created by Luís Resende on 15/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "BEPViewController.h"

@interface BEPViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagem;

- (IBAction)takePicture:(id)sender;
- (IBAction)excluirFoto:(id)sender;


@end

@implementation BEPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;

    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (IBAction)excluirFoto:(id)sender {
    
    if (!self.imagem.image) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sem imagem!" message:@"Nao ha nenhuma imagem salva no app!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }
    self.imagem.image = nil;
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *imagem = info[UIImagePickerControllerEditedImage];
    
    self.imagem.image = imagem;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
