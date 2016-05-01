//
//  Util.h
//  PastaRespostas
//
//  Created by Rodrigo Von-Grapp Freitas on 08/05/14.
//  Copyright (c) 2014 Rodrigo Von-Grapp Freitas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject


+(void)criaPastaRespostas;
+(NSString *)caminhoPastaAmbiente;
+(NSString *)caminhoPastaRespostas;
+(NSMutableArray *) procuraPorExpressao:(NSString*) expression formatSize:(int)formatSize;

@end
