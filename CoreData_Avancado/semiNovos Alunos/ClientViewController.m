//
//  ClientViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/30/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "ClientViewController.h"
#import "ClientModel.h"

#error Importar o Client.h

#import "ClientCarViewController.h"

#import "CarModel.h"

@interface ClientViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDatePicker;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@property (nonatomic) ClientCarViewController *ccvc;
@property (nonatomic) NSMutableArray *cars;

@end

@implementation ClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Adcionar Cliente";
    
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                             target:self
                                                                             action:@selector(saveClient:)];
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    if (self.client) {
#error Caso exista o self.client carregar os dados dele nos campos da UIView
        
#error Preencher o self.cars com os dados do self.client.own
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"Cars: %@", self.cars);
}

- (void)saveClient:(id)sender
{
    
    if (!self.client) {
#error Caso não exista o self.client, crie-o usando o ClientModel
    }
    
#error Carregar o self.client Com os dados dos campos da UIView, não esqueça de carregar o thumbNail
    
#error Preencher o self.client.own com os dados do self.cars
    
    [[CarModel sharedModel] removeCars:self.cars fromCoreData:NO];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    self.photoImageView.image = image;

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)carList:(id)sender {
    if (!self.ccvc) {
        self.ccvc = [[ClientCarViewController alloc] init];
        
        self.ccvc.acquired = self.cars;
    }
    
    [self.navigationController pushViewController:self.ccvc animated:YES];
}

@end
