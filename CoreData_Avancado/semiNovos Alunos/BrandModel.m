//
//  BarndModel.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/29/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "BrandModel.h"
#import "AppDelegate.h"

#error Importar o Brand.h

@interface BrandModel ()

@property (nonatomic) NSMutableArray *privateBrands;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
@implementation BrandModel

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BrandModel sharedModel]"
                                 userInfo:nil];
    return nil;
}

+ (instancetype)sharedModel
{
    static BrandModel *sharedModel = nil;
    
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
        
        [self loadAllBrands];
    }
    return self;
}

- (Brand *)createBrand
{
#error Criar uma marca com todos os dados em branco e retorna-la
}

- (void)loadAllBrands
{
#error Carregar todas as marcas do banco e salva-las no privateBrands.
}

- (NSArray *)allBrands
{
    return [NSArray arrayWithArray:self.privateBrands];
}

@end
