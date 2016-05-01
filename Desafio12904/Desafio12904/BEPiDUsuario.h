//
//  BEPiDUsuario.h
//  Desafio12904
//
//  Created by ALS on 29/04/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BEPiDUsuario : NSObject
{
 NSString *nome;
 NSString *dataNascimento;
 NSString *usuario;
 NSString *senha;
 NSDate *dataCriacao;
}

@property (nonatomic, assign) NSString *nome;
@property (getter = nascimento, setter = setNascimento:) NSString *dataNascimento;
@property (nonatomic, retain) NSString *usuario;
@property (nonatomic) NSString *senha;
@property (nonatomic, readonly) NSDate *dataCriacao;

-(void)setDataCriacao;
-(NSDate *)dataCriacao;
-(void)setSenha:(NSString *)senha;
-(NSData *) encryptString:(NSString*) plaintext withKey:(NSString*)key;



@end
