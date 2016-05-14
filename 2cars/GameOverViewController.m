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
    UILabel *gameOver = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 30, 20)];
    gameOver.text = @"Game Over";
    [gameOver setFont:[UIFont fontWithName: @"Trebuchet MS" size: 14.0f]];
    [self.view addSubview:gameOver];
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
