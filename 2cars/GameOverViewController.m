//
//  GameOverViewController.m
//  2cars
//
//  Created by Pranav Bhandari on 5/14/16.
//  Copyright © 2016 Pranav Bhandari. All rights reserved.
//

#import "GameOverViewController.h"


@interface GameOverViewController ()

@end

@implementation GameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"car.png"]];
    self.view.backgroundColor = [[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1.png"]] colorWithAlphaComponent:0.5];
    CGRect screenRect;
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    
  //  UILabel *gameOver = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
      UILabel *gameOver = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 60, 200, 300, 50)];
    gameOver.text = @"Game Over";
    [gameOver setTextColor:[UIColor whiteColor]];
    [gameOver setFont:[UIFont fontWithName:@"Gill Sans" size:30]];
   // [gameOver setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [self.view addSubview:gameOver];
    
   // UILabel *myScore = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 300, 20)];
    UILabel *myScore = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 45, 250, 300, 50)];
    NSInteger myscr = [[NSUserDefaults standardUserDefaults] integerForKey:@"Score"];
    [myScore setText:[NSString stringWithFormat:@"Score : %ld",(long)myscr]];
    [myScore setTextColor:[UIColor whiteColor]];
    [myScore setFont:[UIFont fontWithName:@"Gill Sans" size:30]];
    // [gameOver setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [self.view addSubview:myScore];
    
   // UILabel *highScore = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 300, 20)];
     UILabel *highScore = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2 - 65, 300, 300, 50)];
    NSInteger hiscr = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    [highScore setText:[NSString stringWithFormat:@"High Score : %ld",(long)hiscr]];
    [highScore setTextColor:[UIColor whiteColor]];
    [highScore setFont:[UIFont fontWithName:@"Gill Sans" size:30]];
    // [gameOver setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [self.view addSubview:highScore];
    
    self.view.alpha = 1.0f;
    // Use UIColor to set alpha transparency of just the background view
  //  self.view.backgroundColor = [UIColor colorWithRed:50.0f green:50.0f blue:50.0f ];

//    UIButton *restart = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
//    
//    UIImage *btnImage = [UIImage imageNamed:@"circle.png"];
//    [restart setImage:btnImage forState:UIControlStateNormal];
//    [self.view addSubview:restart];
//    
//    [restart addTarget:self action:@selector(restartGame) forControlEvents:UIControlEventTouchUpInside];
}

-(void)restartGame
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"Game"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
