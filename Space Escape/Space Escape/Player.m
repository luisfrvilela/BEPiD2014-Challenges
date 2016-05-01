//
//  Player.m
//  Space Escape
//
//  Created by Luís Resende on 08/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "Player.h"

@implementation Player
-(instancetype)initWithPosition:(CGPoint)position{
    self = [super initWithImageNamed:@"player"];
    
    if (self) {
        self.position = position;
        [self startShooting];
    }
    
    return self;
}

-(void)touchesMoved: (NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint lastLocation = [touch previousLocationInNode:self.parent];
    CGPoint touchLocation = [touch locationInNode:self.parent];
    
    CGPoint difference = CGPointMake(touchLocation.x-lastLocation.x, touchLocation.y-lastLocation.y);
    
    self.position = CGPointMake(self.position.x + difference.x, self.position.y + difference.y);
    
    [self checaTela];
}

-(void)checaTela{
    //Se for "fugir" para a direita
    if (self.position.x >= CGRectGetMaxX(self.scene.frame) - self.size.width/2){
        self.position = CGPointMake(CGRectGetMaxX(self.scene.frame) - self.size.width/2, self.position.y) ;
    }
    
    //Se for "fugir" para a esquerda
    if (self.position.x <= CGRectGetMinX(self.scene.frame) + self.size.width/2){
        self.position = CGPointMake(CGRectGetMinX(self.scene.frame) + self.size.width/2, self.position.y) ;
    }
    
    //Se for "fugir" para cima
    if (self.position.y >= CGRectGetMaxY(self.scene.frame) - self.size.height/2){
        self.position = CGPointMake(self.position.x,CGRectGetMaxY(self.scene.frame) - self.size.height/2) ;
    }
    
    //Se for "fugir" para baixo
    if (self.position.y <= CGRectGetMinY(self.scene.frame) + self.size.height/2){
        self.position = CGPointMake(self.position.x ,CGRectGetMinY(self.scene.frame) + self.size.height/2) ;
    }
}

-(void)startShooting{
    SKAction *shoot = [SKAction runBlock:^{[self shootAtAngle:90 andSpeed:150];}];
    SKAction *delay = [SKAction waitForDuration:1.0];
    SKAction *sequence = [SKAction sequence:@[shoot,delay]];
    
    [self runAction:[SKAction repeatActionForever:sequence]];
}

-(void)shootAtAngle:(float)angleDegrees andSpeed:(float)speed{
    Bullet *bullet = [[Bullet alloc]initWithPosition:self.position bulletSpeed:speed angle:angleDegrees andImageNamed:@""];
    [self.parent addChild:bullet];
    SKAction *delay2 = [SKAction waitForDuration:10.0];
    [bullet runAction:[SKAction sequence:@[delay2,[SKAction removeFromParent]]]];
}
@end
