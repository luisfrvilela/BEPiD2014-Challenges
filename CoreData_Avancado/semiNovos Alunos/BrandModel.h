//
//  BarndModel.h
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/29/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Brand;

@interface BrandModel : NSObject

@property (nonatomic, readonly) NSArray *allBrands;

+ (instancetype)sharedModel;

- (Brand *)createBrand;

@end
