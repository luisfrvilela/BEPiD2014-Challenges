//
//  GameScene.m
//  Space Escape
//
//  Created by Luís Resende on 08/10/14.
//  Copyright (c) 2014 Luis Resende. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    self.world = [SKNode node];
    self.hudLayer = [SKNode node];
    
    self.player = [[Player alloc]initWithPosition:CGPointMake(self.size.width/2, self.size.height/4)];
    [self.world addChild:self.player];
    [self addChild:self.world];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.player touchesMoved:touches withEvent:event];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
