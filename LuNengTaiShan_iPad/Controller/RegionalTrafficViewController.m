//
//  RegionalTrafficViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "RegionalTrafficViewController.h"
#import "RegionalTrafficView.h"

@interface RegionalTrafficViewController () {
    CATransition *transition;
    int selectIndex;
    UIView *contentView;
    UIView *menu0View;
    UIView *menu1View;
    UIView *menu2View;
    UIView *menu3View;
    UIButton *menuItem0Button;
    UIButton *menuItem1Button;
    UIButton *menuItem2Button;
    UIButton *menuItem3Button;
    UIImageView *textImageView;
    CALayer *maskLayer;
    BOOL isLoad;
}

@end

@implementation RegionalTrafficViewController

- (id)init {
    self = [super init];
    if (self) {
        selectIndex = -1;
        isLoad = NO;
        
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"regional_traffic_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        [self addContentView];
        
        [self addMenu0View];
        
        [self addMenu1View];
        
        [self addMenu2View];
        
        [self addMenu3View];
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(923, 15, 50, 50)];
        [menuButton setImage:[UIImage imageNamed:@"button_menu.png"] forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(962, 15, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
        
        menuItem0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem0Button setAlpha:0.0];
        [menuItem0Button setTag:0];
        [menuItem0Button setFrame:CGRectMake(559, 695, 102, 36)];
        [menuItem0Button setImage:[UIImage imageNamed:@"regional_traffic_menu_0.png"] forState:UIControlStateNormal];
        [menuItem0Button setImage:[UIImage imageNamed:@"regional_traffic_menu_0_active.png"] forState:UIControlStateHighlighted];
        [menuItem0Button setImage:[UIImage imageNamed:@"regional_traffic_menu_0_active.png"] forState:UIControlStateSelected];
        [menuItem0Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setAlpha:0.0];
        [menuItem1Button setTag:1];
        [menuItem1Button setFrame:CGRectMake(667, 695, 102, 36)];
        [menuItem1Button setImage:[UIImage imageNamed:@"regional_traffic_menu_1.png"] forState:UIControlStateNormal];
        [menuItem1Button setImage:[UIImage imageNamed:@"regional_traffic_menu_1_active.png"] forState:UIControlStateHighlighted];
        [menuItem1Button setImage:[UIImage imageNamed:@"regional_traffic_menu_1_active.png"] forState:UIControlStateSelected];
        [menuItem1Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setAlpha:0.0];
        [menuItem2Button setTag:2];
        [menuItem2Button setFrame:CGRectMake(776, 695, 102, 36)];
        [menuItem2Button setImage:[UIImage imageNamed:@"regional_traffic_menu_2.png"] forState:UIControlStateNormal];
        [menuItem2Button setImage:[UIImage imageNamed:@"regional_traffic_menu_2_active.png"] forState:UIControlStateHighlighted];
        [menuItem2Button setImage:[UIImage imageNamed:@"regional_traffic_menu_2_active.png"] forState:UIControlStateSelected];
        [menuItem2Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        menuItem3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem3Button setAlpha:0.0];
        [menuItem3Button setTag:3];
        [menuItem3Button setFrame:CGRectMake(885, 695, 102, 36)];
        [menuItem3Button setImage:[UIImage imageNamed:@"regional_traffic_menu_3.png"] forState:UIControlStateNormal];
        [menuItem3Button setImage:[UIImage imageNamed:@"regional_traffic_menu_3_active.png"] forState:UIControlStateHighlighted];
        [menuItem3Button setImage:[UIImage imageNamed:@"regional_traffic_menu_3_active.png"] forState:UIControlStateSelected];
        [menuItem3Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem3Button];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(61, 580, 272, 115)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:@"regional_traffic_text.png"]];
        [self.view addSubview:textImageView];
        
        [self performSelector:@selector(showMenuItem0) withObject:nil afterDelay:0.5f];
        [self performSelector:@selector(showMenuItem1) withObject:nil afterDelay:1.0f];
        [self performSelector:@selector(showMenuItem2) withObject:nil afterDelay:1.5f];
        [self performSelector:@selector(showMenuItem3) withObject:nil afterDelay:2.0f];
        [self performSelector:@selector(showText) withObject:nil afterDelay:2.5f];
        //[self performSelector:@selector(showContent) withObject:nil afterDelay:2.5f];
    }
    return self;
}

- (void)showMenuItem0 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem0Button setAlpha:1.0];
    CGRect frame = menuItem0Button.frame;
    frame.origin.x = 509;
    [menuItem0Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenuItem1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem1Button setAlpha:1.0];
    CGRect frame = menuItem1Button.frame;
    frame.origin.x = 617;
    [menuItem1Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenuItem2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem2Button setAlpha:1.0];
    CGRect frame = menuItem2Button.frame;
    frame.origin.x = 726;
    [menuItem2Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenuItem3 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem3Button setAlpha:1.0];
    CGRect frame = menuItem3Button.frame;
    frame.origin.x = 835;
    [menuItem3Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showText {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [textImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showContent {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [contentView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)addContentView {
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    //[contentView setAlpha:0.0];
    [self.view addSubview:contentView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [imageView setImage:[UIImage imageNamed:@"regional_traffic_content_bg.png"]];
    [contentView addSubview:imageView];
    
    UIImageView *circle0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(194, 276, 196, 196)];
    [circle0ImageView setImage:[UIImage imageNamed:@"regional_traffic_content_circle_0.png"]];
    [contentView addSubview:circle0ImageView];
    
    CABasicAnimation *circle0Animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [circle0Animation setDelegate:self];
    //circle0Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle0Animation.duration = 30.0f;
    circle0Animation.repeatCount = HUGE_VALF;
    circle0Animation.autoreverses = NO;
    circle0Animation.fillMode=kCAFillModeForwards;
    circle0Animation.removedOnCompletion = NO;
    circle0Animation.fromValue = [NSNumber numberWithFloat:0.0];
    circle0Animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    [circle0ImageView.layer addAnimation:circle0Animation forKey:@"circle0Rotation"];
    
    UIImageView *circle1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(93, 352, 180, 180)];
    [circle1ImageView setImage:[UIImage imageNamed:@"regional_traffic_content_circle_1.png"]];
    [contentView addSubview:circle1ImageView];
    
    CABasicAnimation *circle1Animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [circle1Animation setDelegate:self];
    //circle1Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle1Animation.duration = 30.0f;
    circle1Animation.repeatCount = HUGE_VALF;
    circle1Animation.autoreverses = NO;
    circle1Animation.fillMode=kCAFillModeForwards;
    circle1Animation.removedOnCompletion = NO;
    circle1Animation.fromValue = [NSNumber numberWithFloat:0.0];
    circle1Animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    [circle1ImageView.layer addAnimation:circle1Animation forKey:@"circle1Rotation"];
    
    UIImageView *circle2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(257, 402, 120, 120)];
    [circle2ImageView setImage:[UIImage imageNamed:@"regional_traffic_content_circle_2.png"]];
    [contentView addSubview:circle2ImageView];
    
    CABasicAnimation *circle2Animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [circle2Animation setDelegate:self];
    //circle2Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle2Animation.duration = 30.0f;
    circle2Animation.repeatCount = HUGE_VALF;
    circle2Animation.autoreverses = NO;
    circle2Animation.fillMode=kCAFillModeForwards;
    circle2Animation.removedOnCompletion = NO;
    circle2Animation.fromValue = [NSNumber numberWithFloat:0.0];
    circle2Animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    [circle2ImageView.layer addAnimation:circle2Animation forKey:@"circle2Rotation"];
    
    UIImageView *circle3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(379, 124, 361, 361)];
    [circle3ImageView setImage:[UIImage imageNamed:@"regional_traffic_content_circle_3.png"]];
    [contentView addSubview:circle3ImageView];
    
    CABasicAnimation *circle3Animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [circle3Animation setDelegate:self];
    //circle3Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle3Animation.duration = 50.0f;
    circle3Animation.repeatCount = HUGE_VALF;
    circle3Animation.autoreverses = NO;
    circle3Animation.fillMode=kCAFillModeForwards;
    circle3Animation.removedOnCompletion = NO;
    circle3Animation.fromValue = [NSNumber numberWithFloat:0.0];
    circle3Animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    [circle3ImageView.layer addAnimation:circle3Animation forKey:@"circle3Rotation"];
}

- (void)addMenu0View {
    menu0View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu0View setAlpha:0.0];
    [self.view addSubview:menu0View];
    
    UIImageView *circle0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(260, 394, 28, 28)];
    [circle0ImageView setAlpha:0.5];
    [circle0ImageView setImage:[UIImage imageNamed:@"regional_traffic_0_circle.png"]];
    [menu0View addSubview:circle0ImageView];
    
    CABasicAnimation *circle0Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle0Animation setDelegate:self];
    circle0Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle0Animation.duration = 1.0f;
    circle0Animation.repeatCount = HUGE_VALF;
    circle0Animation.autoreverses = YES;
    circle0Animation.fillMode=kCAFillModeForwards;
    circle0Animation.removedOnCompletion = NO;
    circle0Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle0Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle0ImageView.layer addAnimation:circle0Animation forKey:@"circle0Scale"];
    
    UIImageView *circle1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(360, 341, 28, 28)];
    [circle1ImageView setAlpha:0.5];
    [circle1ImageView setImage:[UIImage imageNamed:@"regional_traffic_0_circle.png"]];
    [menu0View addSubview:circle1ImageView];
    
    CABasicAnimation *circle1Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle1Animation setDelegate:self];
    circle1Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle1Animation.duration = 1.0f;
    circle1Animation.repeatCount = HUGE_VALF;
    circle1Animation.autoreverses = YES;
    circle1Animation.fillMode=kCAFillModeForwards;
    circle1Animation.removedOnCompletion = NO;
    circle1Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle1Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle1ImageView.layer addAnimation:circle1Animation forKey:@"circle1Scale"];
    
    UIImageView *circle2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(388, 333, 28, 28)];
    [circle2ImageView setAlpha:0.5];
    [circle2ImageView setImage:[UIImage imageNamed:@"regional_traffic_0_circle.png"]];
    [menu0View addSubview:circle2ImageView];
    
    CABasicAnimation *circle2Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle2Animation setDelegate:self];
    circle2Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle2Animation.duration = 1.0f;
    circle2Animation.repeatCount = HUGE_VALF;
    circle2Animation.autoreverses = YES;
    circle2Animation.fillMode=kCAFillModeForwards;
    circle2Animation.removedOnCompletion = NO;
    circle2Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle2Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle2ImageView.layer addAnimation:circle2Animation forKey:@"circle2Scale"];
    
    UIImageView *circle3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(562, 362, 28, 28)];
    [circle3ImageView setAlpha:0.5];
    [circle3ImageView setImage:[UIImage imageNamed:@"regional_traffic_0_circle.png"]];
    [menu0View addSubview:circle3ImageView];
    
    CABasicAnimation *circle3Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle3Animation setDelegate:self];
    circle3Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle3Animation.duration = 1.0f;
    circle3Animation.repeatCount = HUGE_VALF;
    circle3Animation.autoreverses = YES;
    circle3Animation.fillMode=kCAFillModeForwards;
    circle3Animation.removedOnCompletion = NO;
    circle3Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle3Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle3ImageView.layer addAnimation:circle3Animation forKey:@"circle3Scale"];
    
    UIImageView *circle4ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(768, 114, 28, 28)];
    [circle4ImageView setAlpha:0.5];
    [circle4ImageView setImage:[UIImage imageNamed:@"regional_traffic_0_circle.png"]];
    [menu0View addSubview:circle4ImageView];
    
    CABasicAnimation *circle4Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle4Animation setDelegate:self];
    circle4Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle4Animation.duration = 1.0f;
    circle4Animation.repeatCount = HUGE_VALF;
    circle4Animation.autoreverses = YES;
    circle4Animation.fillMode=kCAFillModeForwards;
    circle4Animation.removedOnCompletion = NO;
    circle4Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle4Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle4ImageView.layer addAnimation:circle4Animation forKey:@"circle4Scale"];
    
    UIImageView *circle5ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(834, 384, 28, 28)];
    [circle5ImageView setAlpha:0.5];
    [circle5ImageView setImage:[UIImage imageNamed:@"regional_traffic_0_circle.png"]];
    [menu0View addSubview:circle5ImageView];
    
    CABasicAnimation *circle5Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle5Animation setDelegate:self];
    circle5Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle5Animation.duration = 1.0f;
    circle5Animation.repeatCount = HUGE_VALF;
    circle5Animation.autoreverses = YES;
    circle5Animation.fillMode=kCAFillModeForwards;
    circle5Animation.removedOnCompletion = NO;
    circle5Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle5Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle5ImageView.layer addAnimation:circle5Animation forKey:@"circle5Scale"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [imageView setImage:[UIImage imageNamed:@"regional_traffic_0_bg.png"]];
    [menu0View addSubview:imageView];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(558, 355, 101, 41)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(293, 334, 96, 50)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(827, 377, 124, 44)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(252, 383, 120, 46)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu3Button];
    
    UIButton *subMenu4Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu4Button setTag:4];
    [subMenu4Button setFrame:CGRectMake(388, 328, 94, 46)];
    [subMenu4Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu4Button];
    
    UIButton *subMenu5Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu5Button setTag:5];
    [subMenu5Button setFrame:CGRectMake(762, 108, 114, 46)];
    [subMenu5Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu5Button];
}

- (void)addMenu1View {
    menu1View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu1View setAlpha:0.0];
    [self.view addSubview:menu1View];
    
    UIImageView *circle0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(84, 376, 28, 28)];
    [circle0ImageView setAlpha:0.5];
    [circle0ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle0ImageView];
    
    CABasicAnimation *circle0Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle0Animation setDelegate:self];
    circle0Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle0Animation.duration = 1.0f;
    circle0Animation.repeatCount = HUGE_VALF;
    circle0Animation.autoreverses = YES;
    circle0Animation.fillMode=kCAFillModeForwards;
    circle0Animation.removedOnCompletion = NO;
    circle0Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle0Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle0ImageView.layer addAnimation:circle0Animation forKey:@"circle0Scale"];
    
    UIImageView *circle1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(193, 309, 28, 28)];
    [circle1ImageView setAlpha:0.5];
    [circle1ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle1ImageView];
    
    CABasicAnimation *circle1Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle1Animation setDelegate:self];
    circle1Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle1Animation.duration = 1.0f;
    circle1Animation.repeatCount = HUGE_VALF;
    circle1Animation.autoreverses = YES;
    circle1Animation.fillMode=kCAFillModeForwards;
    circle1Animation.removedOnCompletion = NO;
    circle1Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle1Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle1ImageView.layer addAnimation:circle1Animation forKey:@"circle1Scale"];
    
    UIImageView *circle2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(221, 334, 28, 28)];
    [circle2ImageView setAlpha:0.5];
    [circle2ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle2ImageView];
    
    CABasicAnimation *circle2Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle2Animation setDelegate:self];
    circle2Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle2Animation.duration = 1.0f;
    circle2Animation.repeatCount = HUGE_VALF;
    circle2Animation.autoreverses = YES;
    circle2Animation.fillMode=kCAFillModeForwards;
    circle2Animation.removedOnCompletion = NO;
    circle2Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle2Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle2ImageView.layer addAnimation:circle2Animation forKey:@"circle2Scale"];
    
    UIImageView *circle3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(220, 361, 28, 28)];
    [circle3ImageView setAlpha:0.5];
    [circle3ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle3ImageView];
    
    CABasicAnimation *circle3Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle3Animation setDelegate:self];
    circle3Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle3Animation.duration = 1.0f;
    circle3Animation.repeatCount = HUGE_VALF;
    circle3Animation.autoreverses = YES;
    circle3Animation.fillMode=kCAFillModeForwards;
    circle3Animation.removedOnCompletion = NO;
    circle3Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle3Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle3ImageView.layer addAnimation:circle3Animation forKey:@"circle3Scale"];
    
    UIImageView *circle4ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(259, 301, 28, 28)];
    [circle4ImageView setAlpha:0.5];
    [circle4ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle4ImageView];
    
    CABasicAnimation *circle4Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle4Animation setDelegate:self];
    circle4Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle4Animation.duration = 1.0f;
    circle4Animation.repeatCount = HUGE_VALF;
    circle4Animation.autoreverses = YES;
    circle4Animation.fillMode=kCAFillModeForwards;
    circle4Animation.removedOnCompletion = NO;
    circle4Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle4Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle4ImageView.layer addAnimation:circle4Animation forKey:@"circle4Scale"];
    
    UIImageView *circle5ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(270, 338, 28, 28)];
    [circle5ImageView setAlpha:0.5];
    [circle5ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle5ImageView];
    
    CABasicAnimation *circle5Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle5Animation setDelegate:self];
    circle5Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle5Animation.duration = 1.0f;
    circle5Animation.repeatCount = HUGE_VALF;
    circle5Animation.autoreverses = YES;
    circle5Animation.fillMode=kCAFillModeForwards;
    circle5Animation.removedOnCompletion = NO;
    circle5Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle5Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle5ImageView.layer addAnimation:circle5Animation forKey:@"circle5Scale"];
    
    UIImageView *circle6ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(357, 117, 28, 28)];
    [circle6ImageView setAlpha:0.5];
    [circle6ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle6ImageView];
    
    CABasicAnimation *circle6Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle6Animation setDelegate:self];
    circle6Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle6Animation.duration = 1.0f;
    circle6Animation.repeatCount = HUGE_VALF;
    circle6Animation.autoreverses = YES;
    circle6Animation.fillMode=kCAFillModeForwards;
    circle6Animation.removedOnCompletion = NO;
    circle6Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle6Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle6ImageView.layer addAnimation:circle6Animation forKey:@"circle6Scale"];
    
    UIImageView *circle7ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(492, 461, 28, 28)];
    [circle7ImageView setAlpha:0.5];
    [circle7ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle7ImageView];
    
    CABasicAnimation *circle7Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle7Animation setDelegate:self];
    circle7Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle7Animation.duration = 1.0f;
    circle7Animation.repeatCount = HUGE_VALF;
    circle7Animation.autoreverses = YES;
    circle7Animation.fillMode=kCAFillModeForwards;
    circle7Animation.removedOnCompletion = NO;
    circle7Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle7Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle7ImageView.layer addAnimation:circle7Animation forKey:@"circle7Scale"];
    
    UIImageView *circle8ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(626, 381, 28, 28)];
    [circle8ImageView setAlpha:0.5];
    [circle8ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle8ImageView];
    
    CABasicAnimation *circle8Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle8Animation setDelegate:self];
    circle8Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle8Animation.duration = 1.0f;
    circle8Animation.repeatCount = HUGE_VALF;
    circle8Animation.autoreverses = YES;
    circle8Animation.fillMode=kCAFillModeForwards;
    circle8Animation.removedOnCompletion = NO;
    circle8Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle8Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle8ImageView.layer addAnimation:circle8Animation forKey:@"circle8Scale"];
    
    UIImageView *circle9ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(707, 295, 28, 28)];
    [circle9ImageView setAlpha:0.5];
    [circle9ImageView setImage:[UIImage imageNamed:@"regional_traffic_1_circle.png"]];
    [menu1View addSubview:circle9ImageView];
    
    CABasicAnimation *circle9Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle9Animation setDelegate:self];
    circle9Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle9Animation.duration = 1.0f;
    circle9Animation.repeatCount = HUGE_VALF;
    circle9Animation.autoreverses = YES;
    circle9Animation.fillMode=kCAFillModeForwards;
    circle9Animation.removedOnCompletion = NO;
    circle9Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle9Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle9ImageView.layer addAnimation:circle9Animation forKey:@"circle9Scale"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [imageView setImage:[UIImage imageNamed:@"regional_traffic_1_bg.png"]];
    [menu1View addSubview:imageView];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(177, 335, 79, 31)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(577, 365, 84, 52)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(263, 332, 81, 42)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(701, 288, 99, 43)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu3Button];
    
    UIButton *subMenu4Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu4Button setTag:4];
    [subMenu4Button setFrame:CGRectMake(250, 294, 80, 37)];
    [subMenu4Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu4Button];
    
    UIButton *subMenu5Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu5Button setTag:5];
    [subMenu5Button setFrame:CGRectMake(147, 301, 81, 40)];
    [subMenu5Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu5Button];
    
    UIButton *subMenu6Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu6Button setTag:6];
    [subMenu6Button setFrame:CGRectMake(117, 362, 81, 34)];
    [subMenu6Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu6Button];
    
    UIButton *subMenu7Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu7Button setTag:7];
    [subMenu7Button setFrame:CGRectMake(484, 463, 95, 41)];
    [subMenu7Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu7Button];
    
    UIButton *subMenu8Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu8Button setTag:8];
    [subMenu8Button setFrame:CGRectMake(78, 369, 64, 41)];
    [subMenu8Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu8Button];
}

- (void)addMenu2View {
    menu2View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu2View setAlpha:0.0];
    [self.view addSubview:menu2View];
    
    UIImageView *circle0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(196, 394, 28, 28)];
    [circle0ImageView setAlpha:0.5];
    [circle0ImageView setImage:[UIImage imageNamed:@"regional_traffic_2_circle.png"]];
    [menu2View addSubview:circle0ImageView];
    
    CABasicAnimation *circle0Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle0Animation setDelegate:self];
    circle0Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle0Animation.duration = 1.0f;
    circle0Animation.repeatCount = HUGE_VALF;
    circle0Animation.autoreverses = YES;
    circle0Animation.fillMode=kCAFillModeForwards;
    circle0Animation.removedOnCompletion = NO;
    circle0Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle0Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle0ImageView.layer addAnimation:circle0Animation forKey:@"circle0Scale"];
    
    UIImageView *circle1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(322, 111, 28, 28)];
    [circle1ImageView setAlpha:0.5];
    [circle1ImageView setImage:[UIImage imageNamed:@"regional_traffic_2_circle.png"]];
    [menu2View addSubview:circle1ImageView];
    
    CABasicAnimation *circle1Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle1Animation setDelegate:self];
    circle1Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle1Animation.duration = 1.0f;
    circle1Animation.repeatCount = HUGE_VALF;
    circle1Animation.autoreverses = YES;
    circle1Animation.fillMode=kCAFillModeForwards;
    circle1Animation.removedOnCompletion = NO;
    circle1Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle1Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle1ImageView.layer addAnimation:circle1Animation forKey:@"circle1Scale"];
    
    UIImageView *circle2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(825, 329, 28, 28)];
    [circle2ImageView setAlpha:0.5];
    [circle2ImageView setImage:[UIImage imageNamed:@"regional_traffic_2_circle.png"]];
    [menu2View addSubview:circle2ImageView];
    
    CABasicAnimation *circle2Animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [circle2Animation setDelegate:self];
    circle2Animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    circle2Animation.duration = 1.0f;
    circle2Animation.repeatCount = HUGE_VALF;
    circle2Animation.autoreverses = YES;
    circle2Animation.fillMode=kCAFillModeForwards;
    circle2Animation.removedOnCompletion = NO;
    circle2Animation.fromValue = [NSNumber numberWithFloat:1.0];
    circle2Animation.toValue = [NSNumber numberWithFloat:1.6];
    [circle2ImageView.layer addAnimation:circle2Animation forKey:@"circle2Scale"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [imageView setImage:[UIImage imageNamed:@"regional_traffic_2_bg.png"]];
    [menu2View addSubview:imageView];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(191, 387, 127, 44)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(317, 105, 93, 45)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(817, 321, 116, 45)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu2Button];
}

- (void)addMenu3View {
    menu3View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu3View setAlpha:0.0];
    [self.view addSubview:menu3View];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [imageView setImage:[UIImage imageNamed:@"regional_traffic_3_bg.png"]];
    [menu3View addSubview:imageView];
}

- (void)clickMenuItemButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    [menuItem0Button setSelected:NO];
    [menuItem1Button setSelected:NO];
    [menuItem2Button setSelected:NO];
    [menuItem3Button setSelected:NO];
    
    if(selectIndex == tag) {
        selectIndex = -1;
        
    } else {
        selectIndex = tag;
        
        if(selectIndex == 0) {
            [menuItem0Button setSelected:YES];
        } else if(selectIndex == 1) {
            [menuItem1Button setSelected:YES];
        } else if(selectIndex == 2) {
            [menuItem2Button setSelected:YES];
        } else if(selectIndex == 3) {
            [menuItem3Button setSelected:YES];
            
            if(! isLoad) {
                isLoad = YES;
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                [imageView setImage:[UIImage imageNamed:@"regional_traffic_3_note.png"]];
                [menu3View addSubview:imageView];
                
                maskLayer = [CALayer layer];
                maskLayer.frame = CGRectMake(529, 263, 5, 5);
                maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"mask"].CGImage);
                imageView.layer.mask = maskLayer;
                
                [self performSelector:@selector(showNote) withObject:nil afterDelay:0.5f];
            }
        }
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    if(selectIndex == -1) {
        [contentView setAlpha:1.0];
        [textImageView setAlpha:1.0];
        [menu0View setAlpha:0.0];
        [menu1View setAlpha:0.0];
        [menu2View setAlpha:0.0];
        [menu3View setAlpha:0.0];
    }
    
    if(selectIndex == 0) {
        [contentView setAlpha:0.0];
        [textImageView setAlpha:0.0];
        [menu0View setAlpha:1.0];
        [menu1View setAlpha:0.0];
        [menu2View setAlpha:0.0];
        [menu3View setAlpha:0.0];
    }
    
    if(selectIndex == 1) {
        [contentView setAlpha:0.0];
        [textImageView setAlpha:0.0];
        [menu0View setAlpha:0.0];
        [menu1View setAlpha:1.0];
        [menu2View setAlpha:0.0];
        [menu3View setAlpha:0.0];
    }
    
    if(selectIndex == 2) {
        [contentView setAlpha:0.0];
        [textImageView setAlpha:0.0];
        [menu0View setAlpha:0.0];
        [menu1View setAlpha:0.0];
        [menu2View setAlpha:1.0];
        [menu3View setAlpha:0.0];
    }
    
    if(selectIndex == 3) {
        [contentView setAlpha:0.0];
        [textImageView setAlpha:0.0];
        [menu0View setAlpha:0.0];
        [menu1View setAlpha:0.0];
        [menu2View setAlpha:0.0];
        [menu3View setAlpha:1.0];
    }
    [UIView commitAnimations];
}

- (void)showNote {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setDelegate:self];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 5.0;
    animation.repeatCount = 0;
    animation.autoreverses = NO;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:400.0];
    [maskLayer addAnimation:animation forKey:@"scale"];
}

- (void)cickSubMemuItemButton:(id)sender {
    if(selectIndex == -1) {
        return;
    }
    
    int tag = (int) ((UIButton *)sender).tag;
    
    RegionalTrafficView *regionalTrafficView = [[RegionalTrafficView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) withFatherIndex:selectIndex withIndex:tag];
    [self.view addSubview:regionalTrafficView];
}

- (void)clickMenuButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:NO];
}

- (void)clickCloseButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
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
