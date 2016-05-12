//
//  GameScene.m
//  2cars
//
//  Created by Pranav Bhandari on 5/11/16.
//  Copyright (c) 2016 Pranav Bhandari. All rights reserved.
//

#import "GameScene.h"
SKSpriteNode *red_square,*red_car,*red_square2,*red_square3,*red_square4;
SKLabelNode *score;
int red_cnt = 0,red_sq=0,red_sq2=0,red_sq3=0,red_sq4=0,tmp=0;
//tmp = 0 for circle and 1 for square
Boolean rs = false,rs2 = false, rs3 = false, rs4 = false;
CGRect screenRect;
CGFloat screenWidth;
CGFloat screenHeight;
NSTimer *red_timer,*collision_red;
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
    collision_red = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(col_red) userInfo:nil repeats:YES];
    screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
  //  [self generate_red_Square];
    [self set_Red_car];
}
-(void)col_red
{
    //checking for 1st Square
    if (CGRectIntersectsRect([red_car frame], [red_square frame])) {
        if (red_sq == 1) {
            NSLog(@"tmp = %d",tmp);
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
             [collision_red invalidate];
        }
    }
    
    //checking for 2nd Square
    if (CGRectIntersectsRect([red_car frame], [red_square2 frame])) {
        if (red_sq2 == 1) {
            NSLog(@"tmp = %d",tmp);
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
             [collision_red invalidate];
        }
    }
    //checking for 3rd Square
    if (CGRectIntersectsRect([red_car frame], [red_square3 frame])) {
        if (red_sq3 == 1) {
            NSLog(@"tmp = %d",tmp);
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
             [collision_red invalidate];
        }
    }
    //checking for 4th Square
    if (CGRectIntersectsRect([red_car frame], [red_square4 frame])) {
        if (red_sq4 == 1) {
            NSLog(@"tmp = %d",tmp);
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
            [collision_red invalidate];
        }
    }
    
    //checking if missed circle
    //for 1st circle
    if(red_sq == 0 && rs)
    {
       // NSLog(@"here y position %f",red_square.position.y);
        if(red_square.position.y < 20)
        {
              NSLog(@"position %f",red_square.position.y);
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
            [collision_red invalidate];
        }
    }
    //for 2nd circle
    if(red_sq2 == 0 && rs2)
    {
        if(red_square2.position.y < 20)
        {
              NSLog(@"position2 %f",red_square2.position.y);
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
            [collision_red invalidate];
        }
    }

    //for 3rd circle
    if(red_sq3 == 0 && rs3)
    {
        if(red_square3.position.y < 20)
        {
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
            [collision_red invalidate];
        }
    }

    //for 4th circle
    if(red_sq4 == 0 && rs4)
    {
        if(red_square4.position.y < 20)
        {
            [red_timer invalidate];
            [red_square removeAllActions];
            [red_square2 removeAllActions];
            [red_square3 removeAllActions];
            [red_square4 removeAllActions];
            [collision_red invalidate];
        }
    }

}
-(void)redTime
{
    if(red_cnt == 4)
        red_cnt = 0;
    
    //generation for lane 1 or lane 2
    NSString *image;
    NSInteger randomNumber = arc4random() % 4;
     NSInteger randomImage = arc4random() % 4;
    if (randomImage == 0 || randomImage == 2) {
        image = @"circle";
        tmp = 0;
    }
    else
    {
        image = @"square";
        tmp = 1;
    }
    if(red_cnt == 0)
    {
        rs = true;
        red_sq = tmp;
        if (randomNumber == 0 || randomNumber == 3) {
            red_square = [SKSpriteNode spriteNodeWithImageNamed:image];
            red_square.position = CGPointMake(CGRectGetMidX(self.frame) - 70,screenHeight + 100);
            red_square.name     = @"square";
            
            [self addChild:red_square];
            
            //setting time for the image to slide
            [red_square runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 70,-50) duration:3.0]];
            red_cnt++;
        }
        else
        {
            red_square = [SKSpriteNode spriteNodeWithImageNamed:image];
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
        rs2 = true;
        red_sq2 = tmp;
        if (randomNumber == 0 || randomNumber == 3) {
            red_square2 = [SKSpriteNode spriteNodeWithImageNamed:image];
            red_square2.position = CGPointMake(CGRectGetMidX(self.frame) - 70,screenHeight + 100);
            red_square2.name     = @"square2";
            
            [self addChild:red_square2];
            
            //setting time for the image to slide
            [red_square2 runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 70,-50) duration:3.0]];
            red_cnt++;
        }
        else
        {
            red_square2 = [SKSpriteNode spriteNodeWithImageNamed:image];
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
        rs3 = true;
        red_sq3 = tmp;
        red_square3 = [SKSpriteNode spriteNodeWithImageNamed:image];
        red_square3.name = @"square3";
        if(randomNumber == 0 || randomNumber == 3)
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
        rs4 = true;
        red_sq4 = tmp;
        red_square4 = [SKSpriteNode spriteNodeWithImageNamed:image];
        red_square4.name = @"square4";
        if(randomNumber == 0 || randomNumber == 3)
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
           
            
            [red_car runAction:moveUp completion:^{
              //  [red_car runAction: rotation];
                
               
               // [node setHidden: NO];
                [red_car runAction:moveDown completion:^{
                    [red_car removeAllActions];
                   
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
