//
//  Bullet.m
//  Space Escape
//
//  Created by Luís Resende on 08/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

-(instancetype)initWithPosition:(CGPoint)position bulletSpeed:(float)speed angle:(float)angleDegrees andImageNamed:(NSString *)imageName{
    
    self = [super initWithColor:[UIColor greenColor] size:CGSizeMake(32, 32)];
    
    if (self) {
        float radians = angleDegrees/180*M_PI;
        
        self.position = position;
        self.bulletSpeed = speed;
        self.zRotation = radians;
        
        [self startMoving];
    }
    
    return self;
}

-(void)startMoving{
    CGVector movement = CGVectorMake(cosf(self.zRotation)*self.bulletSpeed, sinf(self.zRotation)*self.bulletSpeed);
    SKAction *move = [SKAction moveBy:movement duration:1];
    [self runAction:[SKAction repeatActionForever:move]];
}
@end
