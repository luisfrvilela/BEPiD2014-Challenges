//
//  GameScene.h
//  Space Escape
//

//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Player.h"

@interface GameScene : SKScene

@property (nonatomic) Player *player;
@property (nonatomic) SKNode *world;
@property (nonatomic) SKNode *hudLayer;

@end
