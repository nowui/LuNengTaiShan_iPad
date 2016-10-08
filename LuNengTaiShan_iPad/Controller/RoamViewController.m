//
//  RoamViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/21/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "RoamViewController.h"
#import "PanoramaViewController.h"

@interface RoamViewController () {
    CATransition *transition;
    NSString *imageName;
    UIImageView *handImageView;
}

@end

@implementation RoamViewController

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        imageName = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PanoramaViewController *panoramaViewController = [[PanoramaViewController alloc] initWithName:imageName];
    [self.view addSubview:panoramaViewController.view];
    [self addChildViewController:panoramaViewController];
    [panoramaViewController didMoveToParentViewController:self];
    
    panoramaViewController.view.frame = self.view.frame;
    
    UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closButton setFrame:CGRectMake(962, 15, 50, 50)];
    [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
    [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closButton];
    
    handImageView = [[UIImageView alloc] initWithFrame:CGRectMake(445, 360, 55, 61)];
    [handImageView setAlpha:0.0];
    [handImageView setImage:[UIImage imageNamed:@"button_hand.png"]];
    [self.view addSubview:handImageView];
    
    [self performSelector:@selector(show) withObject:nil afterDelay:0.1f];
}

- (void)show {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [handImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showRight)];
    [UIView commitAnimations];
}

- (void)showRight {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = handImageView.frame;
    frame.origin.x = 545;
    [handImageView setFrame:frame];
    [UIView setAnimationDidStopSelector:@selector(showLeft)];
    [UIView commitAnimations];
}

- (void)showLeft {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = handImageView.frame;
    frame.origin.x = 445;
    [handImageView setFrame:frame];
    [UIView setAnimationDidStopSelector:@selector(hide)];
    [UIView commitAnimations];
}

- (void)hide {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [handImageView setAlpha:0.0];
    [UIView commitAnimations];
}

- (void)clickCloseButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
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
