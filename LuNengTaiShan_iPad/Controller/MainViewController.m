//
//  MainViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/6/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "MainViewController.h"
#import "BrandViewController.h"
#import "RegionalViewController.h"
#import "ProjectViewController.h"
#import "VideoViewController.h"

@interface MainViewController () {
    CATransition *transition;
    UIImageView *logoImageView;
    UIImageView *footballImageView;
    UIImageView *menu0ImageView;
    UIImageView *menu1ImageView;
    UIImageView *menu2ImageView;
    UIImageView *videoImageView;
}

@end

@implementation MainViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"main_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(186, 512, 170, 93)];
        [logoImageView setAlpha:0.0];
        [logoImageView setImage:[UIImage imageNamed:@"main_logo.png"]];
        [self.view addSubview:logoImageView];
        
        footballImageView = [[UIImageView alloc] initWithFrame:CGRectMake(356, 414, 141, 200)];
        [footballImageView setAlpha:0.0];
        [footballImageView setImage:[UIImage imageNamed:@"main_football.png"]];
        [self.view addSubview:footballImageView];
        
        menu0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(534, 525, 88, 66)];
        [menu0ImageView setAlpha:0.0];
        [menu0ImageView setImage:[UIImage imageNamed:@"main_menu_0.png"]];
        [self.view addSubview:menu0ImageView];
        
        menu1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(684, 525, 108, 66)];
        [menu1ImageView setAlpha:0.0];
        [menu1ImageView setImage:[UIImage imageNamed:@"main_menu_1.png"]];
        [self.view addSubview:menu1ImageView];
        
        menu2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(856, 525, 81, 66)];
        [menu2ImageView setAlpha:0.0];
        [menu2ImageView setImage:[UIImage imageNamed:@"main_menu_2.png"]];
        [self.view addSubview:menu2ImageView];
        
        videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(1031, 507, 71, 106)];
        [videoImageView setAlpha:0.0];
        [videoImageView setImage:[UIImage imageNamed:@"main_video.png"]];
        [self.view addSubview:videoImageView];
        
        UIButton *brandButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [brandButton setFrame:CGRectMake(435, 524, 88, 66)];
        [brandButton addTarget:self action:@selector(clickBrandButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:brandButton];
        
        UIButton *regionalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [regionalButton setFrame:CGRectMake(585, 524, 106, 66)];
        [regionalButton addTarget:self action:@selector(clickRegionalButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:regionalButton];
        
        UIButton *projectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [projectButton setFrame:CGRectMake(757, 524, 80, 66)];
        [projectButton addTarget:self action:@selector(clickProjectButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:projectButton];
        
        UIButton *videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [videoButton setFrame:CGRectMake(930, 524, 74, 66)];
        [videoButton addTarget:self action:@selector(clickVideoButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:videoButton];
        
        [self performSelector:@selector(showLogo) withObject:nil afterDelay:0.5f];
        [self performSelector:@selector(showFootball) withObject:nil afterDelay:0.75f];
        [self performSelector:@selector(showMenu0) withObject:nil afterDelay:1.0f];
        [self performSelector:@selector(showMenu1) withObject:nil afterDelay:1.0f];
        [self performSelector:@selector(showMenu2) withObject:nil afterDelay:1.25f];
        [self performSelector:@selector(showVideo) withObject:nil afterDelay:1.5f];
    }
    return self;
}

- (void)showLogo {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [logoImageView setAlpha:1.0];
    CGRect frame = logoImageView.frame;
    frame.origin.x -= 100;
    [logoImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)showFootball {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [footballImageView setAlpha:1.0];
    CGRect frame = footballImageView.frame;
    frame.origin.x -= 100;
    [footballImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenu0 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [menu0ImageView setAlpha:1.0];
    CGRect frame = menu0ImageView.frame;
    frame.origin.x -= 100;
    [menu0ImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenu1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [menu1ImageView setAlpha:1.0];
    CGRect frame = menu1ImageView.frame;
    frame.origin.x -= 100;
    [menu1ImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenu2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [menu2ImageView setAlpha:1.0];
    CGRect frame = menu2ImageView.frame;
    frame.origin.x -= 100;
    [menu2ImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)showVideo {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [videoImageView setAlpha:1.0];
    CGRect frame = videoImageView.frame;
    frame.origin.x -= 100;
    [videoImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)clickBrandButton:(id)sender {
    BrandViewController *brandViewController = [[BrandViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:brandViewController animated:NO];
}

- (void)clickRegionalButton:(id)sender {
    RegionalViewController *regionalViewController = [[RegionalViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:regionalViewController animated:NO];
}

- (void)clickProjectButton:(id)sender {
    ProjectViewController *projectViewController = [[ProjectViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectViewController animated:NO];
}

- (void)clickVideoButton:(id)sender {
    VideoViewController *videoViewController = [[VideoViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:videoViewController animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
