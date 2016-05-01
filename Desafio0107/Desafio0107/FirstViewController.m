//
//  FirstViewController.m
//  Desafio0107
//
//  Created by Luís Resende on 01/07/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "FirstViewController.h"
#import "Dados.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textNome.delegate = self;
        _textCPF.delegate = self;
        _textTelefone.delegate = self;
        _textSenha.delegate = self;
        _alerta1.delegate = self;
        _alerta2.delegate = self;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_textNome setKeyboardType:UIKeyboardTypeNamePhonePad];
    
    [_textCPF setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    _textCPF.enablesReturnKeyAutomatically = YES;
    
    [_textTelefone setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    
    _textSenha.enablesReturnKeyAutomatically=YES;
    _textSenha.secureTextEntry = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enviar:(id)sender {
    
    _alerta1 = [[UIAlertView alloc]initWithTitle:@"Confirmação!" message:@"Deseja cadastrar?" delegate: self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Cadastrar", nil];
    
    [_alerta1 show];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
   //Validacao nome
    if(textField == _textNome){
        if(textField.text.length < 2){
            _alerta2 = [[UIAlertView alloc]initWithTitle:@"Nome Inválido!" message:@"O nome precisa de no mínimo duas letras" delegate: self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [_alerta2 show];
        }else{
            [_textCPF becomeFirstResponder];
        }
    }
    
    //Validacao cpf
    if(textField == _textCPF){
        if(textField.text.length < 14){
            _alerta2 = [[UIAlertView alloc]initWithTitle:@"CPF Inválido!" message:@"Informe o CPF corretamente" delegate: self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [_alerta2 show];
        }else{
            [_textTelefone becomeFirstResponder];
        }
    }
    
    //Validacao telefone
    if(textField == _textTelefone){
        if(textField.text.length < 18){
            _alerta2 = [[UIAlertView alloc]initWithTitle:@"Telefone Inválido!" message:@"Informe o telefone corretamente" delegate: self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [_alerta2 show];
        }else{
            [_textSenha becomeFirstResponder];
        }
    }
    
    //Validacao senha
    if(textField == _textSenha){
        
        const char *palavra;
        int quantidadeMaisculo=0;
        int quantidadeMinusculo=0;
        int quantidadeNumeros=0;
        
        palavra = [_textSenha.text UTF8String];
        
        for (int i=0; i<_textSenha.text.length; i++) {
            if(palavra[i]>= 'A' && palavra[i] <= 'Z'){
                quantidadeMaisculo++;
            }
            else{
                quantidadeMinusculo++;
            }
        }
        
        palavra = [_textSenha.text UTF8String];
        
        for (int i=0; i<_textSenha.text.length; i++) {
            if(palavra[i]>= '0' && palavra[i] <= '9'){
                quantidadeNumeros++;
            }
        }
        
        if(_textSenha.text.length < 6 || quantidadeMinusculo < 2 || quantidadeMaisculo < 2 || quantidadeNumeros < 2){
            UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Erro!"
                                                            message:@"A senha não pode ser vazia, conter no mínimo 6 ou mais dígitos e deve possuir 2 letras maiúsculas e 2 números."
                                                           delegate:nil
                                                  cancelButtonTitle:@"Digitar novamente!"
                                                  otherButtonTitles:nil];
            [alerta show];
            [_textSenha becomeFirstResponder];
        }
        else{
            return YES;
        }
    }
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == _textTelefone){
        if (range.location == 18) {
            return NO;
        }
        if (range.length == 0 &&
            ![[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[string characterAtIndex:0]]) {
            return NO;
        }
        if (range.length == 0 && range.location == 2) {
            textField.text = [NSString stringWithFormat:@"[+%@](%@", textField.text,string];
            return NO;
        }
        if (range.length == 0 && range.location == 8) {
            textField.text = [NSString stringWithFormat:@"%@)%@", textField.text,string];
            return NO;
        }
        if (range.length == 0 && range.location == 13) {
            textField.text = [NSString stringWithFormat:@"%@-%@", textField.text, string];
            return NO;
        }
        if (range.length == 1 &&
            (range.location == 10 || range.location == 1)){
            range.location--;
            range.length = 2;
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
        if (range.length == 1 && range.location == 6){
            range.location=range.location-2;
            range.length = 3;
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    if (textField == _textCPF){
        if (range.location == 14) {
            return NO;
        }
        if (range.length == 0 &&
            ![[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[string characterAtIndex:0]]) {
            return NO;
        }
        if (range.length == 0 && range.location == 3 &&![[textField.text substringToIndex:1] isEqualToString:@""]) {
            textField.text = [NSString stringWithFormat:@"%@.%@", textField.text,string];
            return NO;
        }
        if (range.length == 0 && range.location == 7) {
            textField.text = [NSString stringWithFormat:@"%@.%@", textField.text,string];
            return NO;
        }
        
        if (range.length == 0 && range.location == 11) {
            textField.text = [NSString stringWithFormat:@"%@/%@", textField.text,string];
            return NO;
        }
        
        if (range.length == 1 && (range.location == 10 || range.location == 1)){
            range.location--;
            range.length = 2;
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
        if (range.length == 1 && range.location == 6){
            range.location=range.location-2;
            range.length = 3;
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    return YES;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Cancelar"]){
       
        [self.textNome setText:@""];
        [self.textCPF setText:@""];
        [self.textTelefone setText:@""];
        [self.textSenha setText:@""];
   
    }
    else if([title  isEqualToString:@"Cadastrar"]){
     
        if(!_informacoesPessoa){
           
            _informacoesPessoa = [[NSMutableArray alloc]init];
       
        }
        
        Dados *informacoes = [[Dados alloc]init];
        
        informacoes.nome = self.textNome.text;
        informacoes.cpf = self.textCPF.text;
        informacoes.telefone = self.textTelefone.text;
        informacoes.senha = self.textSenha.text;
        informacoes.data = [NSDate date];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        
        NSString *plistPath = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/dados.plist"]];
        
        if ([fileManager fileExistsAtPath:plistPath ] == NO) {
            NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"dados" ofType:@"plist"];
            [fileManager copyItemAtPath:resourcePath toPath:plistPath error:&error];
        }
        NSLog(@"%@",plistPath);
        
        
        NSMutableArray * stock = [NSMutableArray arrayWithContentsOfFile:plistPath];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
       
        [dict setObject:informacoes.nome forKey:@"nome"];
        [dict setObject:informacoes.cpf forKey:@"cpf"];
        [dict setObject:informacoes.telefone forKey:@"telefone"];
        [dict setObject:informacoes.senha forKey:@"senha"];
        
        [stock addObject:dict];
        
        [stock writeToFile:plistPath atomically:YES];
        
        [self.textNome setText:@""];
        [self.textCPF setText:@""];
        [self.textTelefone setText:@""];
        [self.textSenha setText:@""];
    }
    
    
}

@end
