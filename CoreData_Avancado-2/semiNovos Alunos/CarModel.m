//
//  CarModel.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/30/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "CarModel.h"
#import "AppDelegate.h"

#error Importar o Car.h

@interface CarModel ()

@property (nonatomic) NSMutableArray *privateCars;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end
@implementation CarModel

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[CarModel sharedModel]"
                                 userInfo:nil];
    return nil;
}

+ (instancetype)sharedModel
{
    static CarModel *sharedModel = nil;
    
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
        
        [self loadAllCars];
    }
    return self;
}

- (Brand *)createCar
{
#error Criar um carro com todos os dados em branco e retorna-lo
}

- (void)loadAllCars
{
#error Carregar todas os carros do banco e salva-los no privateCars.
}

- (void)removeCars:(NSArray *)objects fromCoreData:(BOOL)remove
{
    [self.privateCars removeObjectsInArray:objects];
    
    if (remove) {
        for (NSManagedObject *obj in objects) {
            [self.context deleteObject:obj];
        }
    }
}

- (NSArray *)allCars
{
    return [NSArray arrayWithArray:self.privateCars];
}

@end
