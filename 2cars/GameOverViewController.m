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
    UILabel *gameOver = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 300, 20)];
    gameOver.text = @"Game Over";
    [gameOver setTextColor:[UIColor whiteColor]];
    [gameOver setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [self.view addSubview:gameOver];
    
    
    self.view.alpha = 1.0f;
    // Use UIColor to set alpha transparency of just the background view
    self.view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
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
