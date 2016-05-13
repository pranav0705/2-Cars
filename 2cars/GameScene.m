//
//  GameScene.m
//  2cars
//
//  Created by Pranav Bhandari on 5/11/16.
//  Copyright (c) 2016 Pranav Bhandari. All rights reserved.
//

#import "GameScene.h"
SKSpriteNode *red_square,*red_car,*red_square2,*red_square3,*red_square4,*blue_car;
SKSpriteNode *blue_square,*blue_square2,*blue_square3,*blue_square4;
SKLabelNode *score;
int red_cnt = 0,red_sq=0,red_sq2=0,red_sq3=0,red_sq4=0,tmp=0,scr = 0;
int blue_cnt = 0,blue_sq = 0,blue_sq2=0,blue_sq3=0,blue_sq4=0;
//tmp = 0 for circle and 1 for square
Boolean rs = false,rs2 = false, rs3 = false, rs4 = false;
Boolean bs = false,bs2 = false,bs3 = false, bs4 = false;
//flags to increment score
Boolean scr1 = false,scr2 = false, scr3 = false, scr4 = false;
Boolean bscr1 = false,bscr2 = false, bscr3 = false, bscr4 = false;
CGRect screenRect;
CGFloat screenWidth;
CGFloat screenHeight;
NSTimer *red_timer,*collision_red;
NSTimer *blue_timer,*collision_blue;
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
    //self.scene.backgroundColor = [UIColor yellowColor];
    self.scene.backgroundColor = [UIColor colorWithRed:37/255.0 green:51/255.0 blue:122/255.0 alpha:1];
    
    //1st line from left
    SKShapeNode *yourline = [SKShapeNode node];
    CGMutablePathRef pathToDraw = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw, NULL,CGRectGetMidX(self.frame) - 110,1400);
    CGPathAddLineToPoint(pathToDraw, NULL, CGRectGetMidX(self.frame) - 110, 0);
    yourline.path = pathToDraw;
    [yourline setStrokeColor:[SKColor redColor]];
    [self addChild:yourline];
    
    //2nd line
    SKShapeNode *yourline2 = [SKShapeNode node];
    CGMutablePathRef pathToDraw2 = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw2, NULL, CGRectGetMidX(self.frame),1400);
    CGPathAddLineToPoint(pathToDraw2, NULL, CGRectGetMidX(self.frame), 0);
    yourline2.path = pathToDraw2;
    [yourline2 setStrokeColor:[SKColor redColor]];
    [self addChild:yourline2];
    
    //3rd line
    SKShapeNode *yourline3 = [SKShapeNode node];
    CGMutablePathRef pathToDraw3 = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw3, NULL, CGRectGetMidX(self.frame) + 120,1400);
    CGPathAddLineToPoint(pathToDraw3, NULL, CGRectGetMidX(self.frame) + 120, 0);
    yourline3.path = pathToDraw3;
    [yourline3 setStrokeColor:[SKColor redColor]];
    [self addChild:yourline3];
    
    red_timer = [NSTimer scheduledTimerWithTimeInterval:1.7 target:self selector:@selector(redTime) userInfo:nil repeats:YES];
    collision_red = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(col_red) userInfo:nil repeats:YES];
    
    //timer for blue car
    blue_timer = [NSTimer scheduledTimerWithTimeInterval:1.7 target:self selector:@selector(blueTime) userInfo:nil repeats:YES];
    
    screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    
  //  [self generate_red_Square];
    [self set_Red_car];
    [self set_Blue_car];
    //setting score label
    [self setScoreLabel];
}

-(void)setScoreLabel
{
    score = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    score.position = CGPointMake(CGRectGetWidth(self.frame) - 330, CGRectGetHeight(self.frame)-40);
    score.fontSize = 45;
    [score setFontName:@"Papyrus"];
    score.text = @"0";
    [self addChild:score];
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
        else
        {
            if(scr1)
            {
                scr1 = false;
                red_square.hidden = YES;
                rs = false;
                scr++;
                score.text = [NSString stringWithFormat:@"%d", scr];
            }
            
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
        else
        {
            if(scr2)
            {
                scr2 = false;
                red_square2.hidden = YES;
                rs2 = false;
                scr++;
                score.text = [NSString stringWithFormat:@"%d", scr];
            }
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
        else
        {
            if(scr3)
            {
                scr3 = false;
                red_square3.hidden = YES;
                rs3 = false;
                scr++;
                score.text = [NSString stringWithFormat:@"%d", scr];
            }
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
        else
        {
            if(scr4)
            {
                scr4 = false;
                red_square4.hidden = YES;
                rs4 = false;
                scr++;
                score.text = [NSString stringWithFormat:@"%d", scr];
            }
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

-(void)blueTime
{
    if(blue_cnt == 4)
        blue_cnt = 0;
    
    //image generation
    NSString *image;
    NSInteger randomNumber = arc4random() % 4;
    NSInteger randomImage = arc4random() % 4;
   // if (randomImage == 0 || randomImage == 2) {
        image = @"blue_circle";
        tmp = 0;
    //}
//    else
//    {
//        image = @"square";
//        tmp = 1;
//    }

    if(blue_cnt == 0)
    {
        blue_square.hidden = NO;
        bscr1 = true;
        bs = true;
        blue_sq = tmp;
        blue_square = [SKSpriteNode spriteNodeWithImageNamed:image];
        blue_square.name = @"square";
        if(randomNumber == 0 || randomNumber == 3)
        {
            blue_square.position = CGPointMake(CGRectGetMidX(self.frame) + 60,screenHeight + 100);
        }
        else
        {
            blue_square.position = CGPointMake(CGRectGetMidX(self.frame) + 165,screenHeight + 100);
        }
        [self addChild:blue_square];
        [blue_square runAction:[SKAction moveTo:CGPointMake(blue_square.position.x,-50) duration:3.0]];
        blue_cnt++;
    }
    else if (blue_cnt ==1)
    {
        blue_square2.hidden = NO;
        bscr2 = true;
        bs2 = true;
        blue_sq2 = tmp;
        blue_square2 = [SKSpriteNode spriteNodeWithImageNamed:image];
        blue_square2.name = @"square2";
        if(randomNumber == 0 || randomNumber == 3)
        {
            blue_square2.position = CGPointMake(CGRectGetMidX(self.frame) + 60,screenHeight + 100);
        }
        else
        {
            blue_square2.position = CGPointMake(CGRectGetMidX(self.frame) + 165,screenHeight + 100);
        }
        [self addChild:blue_square2];
        [blue_square2 runAction:[SKAction moveTo:CGPointMake(blue_square2.position.x,-50) duration:3.0]];
        blue_cnt++;
    }
    else if(blue_cnt == 2)
    {
        blue_square3.hidden = NO;
        bscr3 = true;
        bs3 = true;
        blue_sq3 = tmp;
        blue_square3 = [SKSpriteNode spriteNodeWithImageNamed:image];
        blue_square3.name = @"square3";
        if(randomNumber == 0 || randomNumber == 3)
        {
            blue_square3.position = CGPointMake(CGRectGetMidX(self.frame) + 60,screenHeight + 100);
        }
        else
        {
            blue_square3.position = CGPointMake(CGRectGetMidX(self.frame) + 165,screenHeight + 100);
        }
        [self addChild:blue_square3];
        [blue_square3 runAction:[SKAction moveTo:CGPointMake(blue_square3.position.x,-50) duration:3.0]];
        blue_cnt++;
    }
    else
    {
        blue_square4.hidden = NO;
        bscr4 = true;
        bs4 = true;
        blue_sq4 = tmp;
        blue_square4 = [SKSpriteNode spriteNodeWithImageNamed:image];
        blue_square4.name = @"square4";
        if(randomNumber == 0 || randomNumber == 3)
        {
            blue_square4.position = CGPointMake(CGRectGetMidX(self.frame) + 60,screenHeight + 100);
        }
        else
        {
            blue_square4.position = CGPointMake(CGRectGetMidX(self.frame) + 165,screenHeight + 100);
        }
        [self addChild:blue_square4];
        [blue_square4 runAction:[SKAction moveTo:CGPointMake(blue_square4.position.x,-50) duration:3.0]];
        blue_cnt++;
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
        scr1 = true;
        red_square.hidden = NO;
        rs = true;
        red_sq = tmp;
        if (randomNumber == 0 || randomNumber == 3) {
            red_square = [SKSpriteNode spriteNodeWithImageNamed:image];
            red_square.position = CGPointMake(CGRectGetMidX(self.frame) - 60,screenHeight + 100);
            red_square.name     = @"square";
            
            [self addChild:red_square];
            
            //setting time for the image to slide
            [red_square runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 60,-50) duration:3.0]];
            red_cnt++;
        }
        else
        {
            red_square = [SKSpriteNode spriteNodeWithImageNamed:image];
            red_square.position = CGPointMake(CGRectGetMidX(self.frame) - 165,screenHeight + 100);
            red_square.name     = @"square";
        
            [self addChild:red_square];
        
            //setting time for the image to slide
            [red_square runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 165,-50) duration:3.0]];
            red_cnt++;
        }
    }
    else if(red_cnt == 1)
    {
        scr2 = true;
        red_square2.hidden = NO;
        rs2 = true;
        red_sq2 = tmp;
        if (randomNumber == 0 || randomNumber == 3) {
            red_square2 = [SKSpriteNode spriteNodeWithImageNamed:image];
            red_square2.position = CGPointMake(CGRectGetMidX(self.frame) - 60,screenHeight + 100);
            red_square2.name     = @"square2";
            
            [self addChild:red_square2];
            
            //setting time for the image to slide
            [red_square2 runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 60,-50) duration:3.0]];
            red_cnt++;
        }
        else
        {
            red_square2 = [SKSpriteNode spriteNodeWithImageNamed:image];
            red_square2.position = CGPointMake(CGRectGetMidX(self.frame) - 165,screenHeight + 100);
            red_square2.name     = @"square2";
            
            [self addChild:red_square2];
            
            //setting time for the image to slide
            [red_square2 runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 165,-50) duration:3.0]];
            red_cnt++;
        }
    }
    else if (red_cnt == 2)
    {
        scr3 = true;
        rs3 = true;
        red_sq3 = tmp;
        red_square3.hidden = NO;
        red_square3 = [SKSpriteNode spriteNodeWithImageNamed:image];
        red_square3.name = @"square3";
        if(randomNumber == 0 || randomNumber == 3)
        {
            red_square3.position = CGPointMake(CGRectGetMidX(self.frame) - 60,screenHeight + 100);
        }
        else
        {
            red_square3.position = CGPointMake(CGRectGetMidX(self.frame) - 165,screenHeight + 100);
        }
        [self addChild:red_square3];
        [red_square3 runAction:[SKAction moveTo:CGPointMake(red_square3.position.x,-50) duration:3.0]];
        red_cnt++;
    }
    else
    {
        red_square4.hidden = NO;
        scr4 = true;
        rs4 = true;
        red_sq4 = tmp;
        red_square4 = [SKSpriteNode spriteNodeWithImageNamed:image];
        red_square4.name = @"square4";
        if(randomNumber == 0 || randomNumber == 3)
        {
            red_square4.position = CGPointMake(CGRectGetMidX(self.frame) - 60,screenHeight + 100);
        }
        else
        {
            red_square4.position = CGPointMake(CGRectGetMidX(self.frame) - 165,screenHeight + 100);
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
    
    UITouch *myTouch = [touches anyObject];
    
    CGPoint aPoint = [myTouch locationInView:self.view];
    red_car.name = @"car";
    blue_car.name = @"blue_car";
    if(aPoint.x < 190) { //Left
        //NSLog(@"Tapping on the left side of the screen is for communists! %f and %f",screenWidth,aPoint.x);
        if(red_car.position.x == (CGRectGetMidX(self.frame) - 165))
        {
            
            [red_car runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 60,30) duration:0.4]];
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
            [red_car runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) - 165,30) duration:0.4]];
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
        else // Right
        {
            if(blue_car.position.x == (CGRectGetMidX(self.frame) + 60))
            {
                
                [blue_car runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) + 165,30) duration:0.4]];
                //  SKAction *rotation = [SKAction rotateByAngle: 0 duration:0.5];
                //and just run the action
                // [red_car runAction: rotation];
                SKAction *moveUp = [SKAction rotateByAngle: -M_PI/4.0 duration:0.2];
                SKAction *moveDown = [SKAction rotateByAngle: M_PI/4.0 duration:0.2];
                
                [self enumerateChildNodesWithName:@"blue_car" usingBlock:^(SKNode *node, BOOL *stop) {
                    
                    
                    [blue_car runAction:moveUp completion:^{
                        //  [red_car runAction: rotation];
                        
                        
                        // [node setHidden: NO];
                        [blue_car runAction:moveDown completion:^{
                            [blue_car removeAllActions];
                            
                        }];
                    }];
                }];
            }
            else
            {
                [blue_car runAction:[SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame) + 60,30) duration:0.4]];
                SKAction *moveUp = [SKAction rotateByAngle: M_PI/4.0 duration:0.2];
                SKAction *moveDown = [SKAction rotateByAngle: -M_PI/4.0 duration:0.2];
                [self enumerateChildNodesWithName:@"blue_car" usingBlock:^(SKNode *node, BOOL *stop) {
                    
                    
                    [blue_car runAction:moveUp completion:^{
                        //  [red_car runAction: rotation];
                        
                        
                        // [node setHidden: NO];
                        [blue_car runAction:moveDown completion:^{
                            [blue_car removeAllActions];
                            
                        }];
                    }];
                }];
            }
        }
}

-(void)set_Red_car
{
    red_car = [SKSpriteNode spriteNodeWithImageNamed:@"car"];
    red_car.position = CGPointMake(CGRectGetMidX(self.frame) - 165, 30);
    [self addChild:red_car];
}
-(void)set_Blue_car
{
    blue_car = [SKSpriteNode spriteNodeWithImageNamed:@"blue_car"];
    blue_car.position = CGPointMake(CGRectGetMidX(self.frame) + 60, 30);
    [self addChild:blue_car];
}

-(void)generate_red_Square
{
    red_square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
   // red_square.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
     red_square.position = CGPointMake(CGRectGetMidX(self.frame) - 165,screenHeight + 100);
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
