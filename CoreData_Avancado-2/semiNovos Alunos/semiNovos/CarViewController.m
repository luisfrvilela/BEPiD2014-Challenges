//
//  CarViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/30/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "CarViewController.h"
#import "CarModel.h"

#error Importar o Car.h

#import "BrandModel.h"
#error Importar o Brand.h

@interface CarViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *brandPicker;
@property (weak, nonatomic) IBOutlet UITextField *modelTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (weak, nonatomic) IBOutlet UITextField *modelYearTextField;
@property (weak, nonatomic) IBOutlet UITextField *manufactureYearTextField;

@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Adcionar Carro";
    
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                             target:self
                                                                             action:@selector(saveCar:)];
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    if (self.car) {
#error Caso exista o self.car carregar os dados dele nos campos da UIView
    }
}

- (void)saveCar:(id)sender
{
    if (!self.car) {
#error Caso não exista o self.car, crie-o usando o CarModel
    }
#error Carregar o self.car Com os dados dos campos da UIView
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
#error Retornar o número de marcas cadastrados
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
#error Retornar o nome da marca selecionada
}

@end
