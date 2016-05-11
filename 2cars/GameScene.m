//
//  GameScene.m
//  2cars
//
//  Created by Pranav Bhandari on 5/11/16.
//  Copyright (c) 2016 Pranav Bhandari. All rights reserved.
//

#import "GameScene.h"
SKSpriteNode *red_square;
@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
//    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//    
//    myLabel.text = @"Hello, World!";
//    myLabel.fontSize = 45;
//    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
//                                   CGRectGetMidY(self.frame));
//    
//    [self addChild:myLabel];
    
    [self generate_red_Square];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
}

-(void)generate_red_Square
{
    red_square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
    red_square.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    //red_square.size     = CGSizeMake(80, 56);
    red_square.name     = @"square";
    
    [self addChild:red_square];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
