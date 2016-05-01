//
//  ClientModel.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/30/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "ClientModel.h"
#import "AppDelegate.h"

#error Importar o Client.h

@interface ClientModel ()

@property (nonatomic) NSMutableArray *privateClients;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
@implementation ClientModel

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[ClientModel sharedModel]"
                                 userInfo:nil];
    return nil;
}

+ (instancetype)sharedModel
{
    static ClientModel *sharedModel = nil;
    
    if (!sharedModel) {
        sharedModel = [[self alloc] initPrivate];
    }
    
    return sharedModel;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        _context = appDelegate.managedObjectContext;
        
        [self loadAllClients];
    }
    return self;
}

- (Client *)createClient
{
#error Criar um cliente com todos os dados em branco e retorna-lo
}

- (void)loadAllClients
{
#error Carregar todos os clientes do banco e salva-los no privateClients.
}

- (NSArray *)allClients
{
    return [NSArray arrayWithArray:self.privateClients];
}

@end