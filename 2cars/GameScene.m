//
//  GameScene.m
//  2cars
//
//  Created by Pranav Bhandari on 5/11/16.
//  Copyright (c) 2016 Pranav Bhandari. All rights reserved.
//

#import "GameScene.h"
SKSpriteNode *red_square,*red_car,*red_square2,*red_square3,*red_square4;
int red_cnt = 0;
CGRect screenRect;
CGFloat screenWidth;
CGFloat screenHeight;
NSTimer *red_timer;
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
    red_timer = [NSTimer scheduledTimerWithTimeInterval:1.7 target:self selector:@selector(redTime) userInfo:nil repeats:YES];
    screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    [self generate_red_Square];
    [self set_Red_car];
}
-(void)redTime
{
    if(red_cnt == 4)
        red_cnt = 0;
    
    //generation for lane 1 or lane 2
    NSInteger randomNumber = arc4random() % 2;
    if(red_cnt == 0)
    {
        if (randomNumber == 0) {
            red_square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
            red_square.position = CGPointMake(CGRectGetMidX(self.frame) - 70,screenHeight + 100);
            red_square.name     = @"square";
            
            [self addChild:red_square];
            
            //setting time for the image to slide
            [red_square runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 70,-50) duration:3.0]];
            red_cnt++;
        }
        else
        {
            red_square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
            red_square.position = CGPointMake(CGRectGetMidX(self.frame) - 170,screenHeight + 100);
            red_square.name     = @"square";
        
            [self addChild:red_square];
        
            //setting time for the image to slide
            [red_square runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 170,-50) duration:3.0]];
            red_cnt++;
        }
    }
    else if(red_cnt == 1)
    {
        if (randomNumber == 0) {
            red_square2 = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
            red_square2.position = CGPointMake(CGRectGetMidX(self.frame) - 70,screenHeight + 100);
            red_square2.name     = @"square2";
            
            [self addChild:red_square2];
            
            //setting time for the image to slide
            [red_square2 runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 70,-50) duration:3.0]];
            red_cnt++;
        }
        else
        {
            red_square2 = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
            red_square2.position = CGPointMake(CGRectGetMidX(self.frame) - 170,screenHeight + 100);
            red_square2.name     = @"square2";
            
            [self addChild:red_square2];
            
            //setting time for the image to slide
            [red_square2 runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 170,-50) duration:3.0]];
            red_cnt++;
        }
    }
    else if (red_cnt == 2)
    {
        red_square3 = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
        red_square3.name = @"square3";
        if(randomNumber == 0)
        {
            red_square3.position = CGPointMake(CGRectGetMidX(self.frame) - 70,screenHeight + 100);
        }
        else
        {
            red_square3.position = CGPointMake(CGRectGetMidX(self.frame) - 170,screenHeight + 100);
        }
        [self addChild:red_square3];
        [red_square3 runAction:[SKAction moveTo:CGPointMake(red_square3.position.x,-50) duration:3.0]];
        red_cnt++;
    }
    else
    {
        red_square4 = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
        red_square4.name = @"square4";
        if(randomNumber == 0)
        {
            red_square4.position = CGPointMake(CGRectGetMidX(self.frame) - 70,screenHeight + 100);
        }
        else
        {
            red_square4.position = CGPointMake(CGRectGetMidX(self.frame) - 170,screenHeight + 100);
        }
        [self addChild:red_square4];
        [red_square4 runAction:[SKAction moveTo:CGPointMake(red_square4.position.x,-50) duration:3.0]];
        red_cnt++;

    }
    
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
    red_car.name = @"car";
    if(red_car.position.x == (CGRectGetMidX(self.frame) - 170))
    {
       
        [red_car runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 70,30) duration:0.4]];
      //  SKAction *rotation = [SKAction rotateByAngle: 0 duration:0.5];
        //and just run the action
       // [red_car runAction: rotation];
        SKAction *moveUp = [SKAction rotateByAngle: -M_PI/4.0 duration:0.2];
        SKAction *moveDown = [SKAction rotateByAngle: M_PI/4.0 duration:0.2];
        
        [self enumerateChildNodesWithName:@"car" usingBlock:^(SKNode *node, BOOL *stop) {
            NSLog(@"RUNNING MOVE UP");
            
            [red_car runAction:moveUp completion:^{
              //  [red_car runAction: rotation];
                
                NSLog(@"RUNNING MOVE DOWN");
               // [node setHidden: NO];
                [red_car runAction:moveDown completion:^{
                    [red_car removeAllActions];
                    NSLog(@"STARTING MOVEMENT");
                }];
            }];
        }];
    }
    else
    {
        [red_car runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 170,30) duration:0.4]];
        SKAction *moveUp = [SKAction rotateByAngle: M_PI/4.0 duration:0.2];
        SKAction *moveDown = [SKAction rotateByAngle: -M_PI/4.0 duration:0.2];
        [self enumerateChildNodesWithName:@"car" usingBlock:^(SKNode *node, BOOL *stop) {
           
            
            [red_car runAction:moveUp completion:^{
                //  [red_car runAction: rotation];
                
                
                // [node setHidden: NO];
                [red_car runAction:moveDown completion:^{
                    [red_car removeAllActions];
                   
                }];
            }];
        }];
    }
        
    
 
}

-(void)set_Red_car
{
    red_car = [SKSpriteNode spriteNodeWithImageNamed:@"car"];
    red_car.position = CGPointMake(CGRectGetMidX(self.frame) - 170, 30);
    [self addChild:red_car];
}

-(void)generate_red_Square
{
    red_square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
   // red_square.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
     red_square.position = CGPointMake(CGRectGetMidX(self.frame) - 170,screenHeight + 100);
    //red_square.size     = CGSizeMake(80, 56);
    red_square.name     = @"square";
    
    [self addChild:red_square];
    
//    double distance = sqrt(pow((CGRectGetMidX(self.frame) - 170 - red_square.position.x), 2.0) + pow((20 - red_square.position.y), 2.0));
//    
//    //calculate your new duration based on the distance
//    float moveDuration = 0.009*distance;
//    
//    //move the node
//    SKAction *move = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 170,0) duration: moveDuration];
//    [red_square runAction: move];
    
    //setting time for the image to slide
    [red_square runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 170,-50) duration:3.0]];
    red_cnt++;
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
