//
//  Bullet.h
//  Space Escape
//
//  Created by Luís Resende on 08/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Bullet : SKSpriteNode

-(instancetype)initWithPosition:(CGPoint)position bulletSpeed:(float)speed angle:(float)angleDegrees andImageNamed:(NSString *)imageName;

@property (nonatomic) float bulletSpeed;

@end
