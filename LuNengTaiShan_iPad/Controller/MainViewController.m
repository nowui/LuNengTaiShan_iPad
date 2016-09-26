//
//  MainViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/6/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "MainViewController.h"
#import "BrandViewController.h"
#import "RegionalTrafficViewController.h"
#import "ProjectViewController.h"
#import "VideoViewController.h"

@interface MainViewController () {
    CATransition *transition;
    UIImageView *logoImageView;
    UIImageView *footballImageView;
    UIButton *menu0Button;
    UIButton *menu1Button;
    UIButton *menu2Button;
    UIButton *menu3Button;
}

@end

@implementation MainViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
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
        
        menu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu0Button setAlpha:0.0];
        [menu0Button setFrame:CGRectMake(534, 525, 88, 66)];
        [menu0Button setImage:[UIImage imageNamed:@"main_menu_0"] forState:UIControlStateNormal];
        [menu0Button setImage:[UIImage imageNamed:@"main_menu_0_active.png"] forState:UIControlStateHighlighted];
        [menu0Button addTarget:self action:@selector(clickBrandButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu0Button];
        
        menu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu1Button setAlpha:0.0];
        [menu1Button setFrame:CGRectMake(684, 525, 108, 66)];
        [menu1Button setImage:[UIImage imageNamed:@"main_menu_1"] forState:UIControlStateNormal];
        [menu1Button setImage:[UIImage imageNamed:@"main_menu_1_active.png"] forState:UIControlStateHighlighted];
        [menu1Button addTarget:self action:@selector(clickRegionalButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu1Button];
        
        menu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu2Button setAlpha:0.0];
        [menu2Button setFrame:CGRectMake(856, 525, 81, 66)];
        [menu2Button setImage:[UIImage imageNamed:@"main_menu_2"] forState:UIControlStateNormal];
        [menu2Button setImage:[UIImage imageNamed:@"main_menu_2_active.png"] forState:UIControlStateHighlighted];
        [menu2Button addTarget:self action:@selector(clickProjectButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu2Button];
        
        menu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu3Button setAlpha:0.0];
        [menu3Button setFrame:CGRectMake(1031, 509, 71, 106)];
        [menu3Button setImage:[UIImage imageNamed:@"main_video.png"] forState:UIControlStateNormal];
        [menu3Button addTarget:self action:@selector(clickVideoButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu3Button];
        
        UIButton *projectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [projectButton setFrame:CGRectMake(757, 524, 80, 66)];
        [projectButton addTarget:self action:@selector(clickProjectButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:projectButton];
        
        UIButton *videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [videoButton setFrame:CGRectMake(930, 524, 74, 66)];
        [videoButton addTarget:self action:@selector(clickVideoButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:videoButton];
        
        [self performSelector:@selector(showLogo) withObject:nil afterDelay:0.5f];
        [self performSelector:@selector(showFootball) withObject:nil afterDelay:1.0f];
        [self performSelector:@selector(showMenu0) withObject:nil afterDelay:1.5f];
        [self performSelector:@selector(showMenu1) withObject:nil afterDelay:2.0f];
        [self performSelector:@selector(showMenu2) withObject:nil afterDelay:2.5f];
        [self performSelector:@selector(showVideo) withObject:nil afterDelay:3.0f];
    }
    return self;
}

- (void)showLogo {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [logoImageView setAlpha:1.0];
    CGRect frame = logoImageView.frame;
    frame.origin.x -= 100;
    [logoImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)showFootball {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [footballImageView setAlpha:1.0];
    CGRect frame = footballImageView.frame;
    frame.origin.x -= 100;
    [footballImageView setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenu0 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menu0Button setAlpha:1.0];
    CGRect frame = menu0Button.frame;
    frame.origin.x -= 100;
    [menu0Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenu1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menu1Button setAlpha:1.0];
    CGRect frame = menu1Button.frame;
    frame.origin.x -= 100;
    [menu1Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenu2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menu2Button setAlpha:1.0];
    CGRect frame = menu2Button.frame;
    frame.origin.x -= 100;
    [menu2Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showVideo {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menu3Button setAlpha:1.0];
    CGRect frame = menu3Button.frame;
    frame.origin.x -= 100;
    [menu3Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)clickBrandButton:(id)sender {
    BrandViewController *brandViewController = [[BrandViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:brandViewController animated:NO];
}

- (void)clickRegionalButton:(id)sender {
    RegionalTrafficViewController *regionalTrafficViewController = [[RegionalTrafficViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:regionalTrafficViewController animated:NO];
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
