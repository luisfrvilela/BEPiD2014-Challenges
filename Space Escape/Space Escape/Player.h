//
//  Player.h
//  Space Escape
//
//  Created by Luís Resende on 08/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Bullet.h"

@interface Player : SKSpriteNode

-(instancetype)initWithPosition:(CGPoint)position;
-(void)destroyPlayer;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end
