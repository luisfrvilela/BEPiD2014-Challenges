//
//  Endereco.m
//  aula7.3
//
//  Created by Cayke on 29/04/14.
//  Copyright (c) 2014 Cayke. All rights reserved.
//

#import "Endereco.h"

@implementation Endereco

- (instancetype)initWithCep: (NSString *) cep
{
    self = [super init];
    if (self) {
        NSMutableString *url = [[NSMutableString alloc]initWithString:@"http://appservidor.com.br/webservice/cep?cep="];
        
        [url appendString:cep];
        [url appendString:@"&saida=json"];
        
        NSData *endereco = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
        
        NSError *error;
        NSDictionary *dict;
        
        
        
        id arquivoJson = [NSJSONSerialization JSONObjectWithData:endereco options:NSJSONReadingAllowFragments error:&error];
        
        
        if([arquivoJson isKindOfClass:[NSDictionary class]])
        {
            dict = arquivoJson;
            
            self.CEP = [dict objectForKey:@"cep"];
            self.logradouro = [dict objectForKey:@"logradouro"];
            self.logradouro_nome = [dict objectForKey:@"logradouro_nome"];
            self.logradouro_completo = [dict objectForKey:@"logradouro_completo"];
            self.bairro = [dict objectForKey:@"bairro"];
            self.cidade = [dict objectForKey:@"cidade"];
            self.uf_sigla = [dict objectForKey:@"uf_sigla"];
            self.uf_nome = [dict objectForKey:@"uf_nome"];
            
            
        }
        
        
        
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"cep: %@\nlogradouro: %@\nlogradouro nome: %@\nlogradouro completo: %@\nbairro: %@\ncidade: %@\nuf_sigla: %@\nuf_nome: %@", _CEP, _logradouro, _logradouro_nome, _logradouro_completo, _bairro, _cidade,_uf_sigla, _uf_nome];
}

@end
