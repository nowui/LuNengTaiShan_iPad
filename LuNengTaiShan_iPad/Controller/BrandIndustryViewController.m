//
//  BrandIndustryViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandIndustryViewController.h"
#import "BrandIndustryView.h"

@interface BrandIndustryViewController () {
    UIImageView *backgroundImageView;
    CATransition *transition;
    int selectIndex;
    UIButton *neimengguButton;//内蒙古-0
    UIButton *xinjianButton;//新疆-1
    UIButton *gansuButton;//甘肃-2
    UIButton *hunanButton;//湖南-3
    UIButton *sichuanButton;//四川-4
    UIButton *hainanButton;//海南-5
    UIButton *tianjinButton;//天津-6
    UIButton *shandongButton;//山东-7
    UIButton *chongqingButton;//重庆-8
    UIButton *liaoningButton;//辽宁-9
    UIButton *jiangsuButton;//江苏-10
    UIButton *hebeiButton;//河北-11
    UIButton *beijingButton;//北京-12
    UIButton *guangdongButton;//广东-13
    UIButton *jilingButton;//吉林-14
    UIButton *menuItem0Button;
    UIButton *menuItem1Button;
    UIButton *menuItem2Button;
    UIButton *menuItem3Button;
    UIImageView *neimengguImageView;
    UIImageView *xinjianImageView;
    UIImageView *gansuImageView;
    UIImageView *hunanImageView;
    UIImageView *sichuanImageView;
    UIImageView *hainanImageView;
    UIImageView *tianjinImageView;
    UIImageView *shandongImageView;
    UIImageView *chongqingImageView;
    UIImageView *liaoningImageView;
    UIImageView *jiangsuImageView;
    UIImageView *hebeiImageView;
    UIImageView *beijingImageView;
    UIImageView *guangdongImageView;
    UIImageView *jilingImageView;
    UIView *menuView;
    CALayer *maskLayer;
}

@end

@implementation BrandIndustryViewController

- (id)init {
    self = [super init];
    if (self) {
        selectIndex = 0;
        
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"brand_industry_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [self.view addSubview:menuView];
        
        CABasicAnimation *circleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [circleAnimation setDelegate:self];
        circleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        circleAnimation.duration = 1.0f;
        circleAnimation.repeatCount = HUGE_VALF;
        circleAnimation.autoreverses = YES;
        circleAnimation.fillMode=kCAFillModeForwards;
        circleAnimation.removedOnCompletion = NO;
        circleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        circleAnimation.toValue = [NSNumber numberWithFloat:1.7];
        
        neimengguImageView = [[UIImageView alloc] initWithFrame:CGRectMake(563, 295, 35, 8)];
        [neimengguImageView setAlpha:0.0];
        [neimengguImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [neimengguImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:neimengguImageView];
        
        xinjianImageView = [[UIImageView alloc] initWithFrame:CGRectMake(246, 275, 35, 8)];
        [xinjianImageView setAlpha:0.0];
        [xinjianImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [xinjianImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:xinjianImageView];
        
        gansuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(524, 409, 35, 8)];
        [gansuImageView setAlpha:0.0];
        [gansuImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [gansuImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:gansuImageView];
        
        hunanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(643, 542, 35, 8)];
        [hunanImageView setAlpha:0.0];
        [hunanImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [hunanImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:hunanImageView];
        
        sichuanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(532, 496, 35, 8)];
        [sichuanImageView setAlpha:0.0];
        [sichuanImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [sichuanImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:sichuanImageView];
        
        hainanImageView = [[UIImageView alloc] initWithFrame:CGRectMake(619, 690, 35, 8)];
        [hainanImageView setAlpha:0.0];
        [hainanImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [hainanImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:hainanImageView];
        
        tianjinImageView = [[UIImageView alloc] initWithFrame:CGRectMake(702, 317, 35, 8)];
        [tianjinImageView setAlpha:0.0];
        [tianjinImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [tianjinImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:tianjinImageView];
        
        shandongImageView = [[UIImageView alloc] initWithFrame:CGRectMake(732, 374, 35, 8)];
        [shandongImageView setAlpha:0.0];
        [shandongImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [shandongImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:shandongImageView];
        
        chongqingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(614, 483, 35, 8)];
        [chongqingImageView setAlpha:0.0];
        [chongqingImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [chongqingImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:chongqingImageView];
        
        liaoningImageView = [[UIImageView alloc] initWithFrame:CGRectMake(821, 276, 35, 8)];
        [liaoningImageView setAlpha:0.0];
        [liaoningImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [liaoningImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:liaoningImageView];
        
        jiangsuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(761, 428, 35, 8)];
        [jiangsuImageView setAlpha:0.0];
        [jiangsuImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [jiangsuImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:jiangsuImageView];
        
        hebeiImageView = [[UIImageView alloc] initWithFrame:CGRectMake(665, 358, 35, 8)];
        [hebeiImageView setAlpha:0.0];
        [hebeiImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [hebeiImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:hebeiImageView];
        
        beijingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(674, 302, 35, 8)];
        [beijingImageView setAlpha:0.0];
        [beijingImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [beijingImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:beijingImageView];
        
        guangdongImageView = [[UIImageView alloc] initWithFrame:CGRectMake(678, 600, 35, 8)];
        [guangdongImageView setAlpha:0.0];
        [guangdongImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [guangdongImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:guangdongImageView];
        
        jilingImageView = [[UIImageView alloc] initWithFrame:CGRectMake(808, 219, 35, 8)];
        [jilingImageView setAlpha:0.0];
        [jilingImageView setImage:[UIImage imageNamed:@"brand_industry_circle.png"]];
        [jilingImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [menuView addSubview:jilingImageView];
        
        neimengguButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [neimengguButton setTag:0];
        [neimengguButton setFrame:CGRectMake(560, 246, 44, 58)];
        [neimengguButton setImage:[UIImage imageNamed:@"brand_industry_neimenggu.png"] forState:UIControlStateNormal];
        [neimengguButton setImage:[UIImage imageNamed:@"brand_industry_neimenggu.png"] forState:UIControlStateHighlighted];
        [neimengguButton setImage:[UIImage imageNamed:@"brand_industry_neimenggu_active.png"] forState:UIControlStateSelected];
        [neimengguButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:neimengguButton];
        
        xinjianButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [xinjianButton setTag:1];
        [xinjianButton setFrame:CGRectMake(247, 226, 35, 58)];
        [xinjianButton setImage:[UIImage imageNamed:@"brand_industry_xinjian.png"] forState:UIControlStateNormal];
        [xinjianButton setImage:[UIImage imageNamed:@"brand_industry_xinjian.png"] forState:UIControlStateHighlighted];
        [xinjianButton setImage:[UIImage imageNamed:@"brand_industry_xinjian_active.png"] forState:UIControlStateSelected];
        [xinjianButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:xinjianButton];
        
        gansuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [gansuButton setTag:2];
        [gansuButton setFrame:CGRectMake(525, 361, 35, 58)];
        [gansuButton setImage:[UIImage imageNamed:@"brand_industry_gansu.png"] forState:UIControlStateNormal];
        [gansuButton setImage:[UIImage imageNamed:@"brand_industry_gansu.png"] forState:UIControlStateHighlighted];
        [gansuButton setImage:[UIImage imageNamed:@"brand_industry_gansu_active.png"] forState:UIControlStateSelected];
        [gansuButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:gansuButton];
        
        hunanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [hunanButton setTag:3];
        [hunanButton setFrame:CGRectMake(644, 493, 35, 58)];
        [hunanButton setImage:[UIImage imageNamed:@"brand_industry_gansu.png"] forState:UIControlStateNormal];
        [hunanButton setImage:[UIImage imageNamed:@"brand_industry_gansu.png"] forState:UIControlStateHighlighted];
        [hunanButton setImage:[UIImage imageNamed:@"brand_industry_gansu_active.png"] forState:UIControlStateSelected];
        [hunanButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:hunanButton];
        
        sichuanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sichuanButton setTag:4];
        [sichuanButton setFrame:CGRectMake(533, 446, 35, 58)];
        [sichuanButton setImage:[UIImage imageNamed:@"brand_industry_sichuan.png"] forState:UIControlStateNormal];
        [sichuanButton setImage:[UIImage imageNamed:@"brand_industry_sichuan.png"] forState:UIControlStateHighlighted];
        [sichuanButton setImage:[UIImage imageNamed:@"brand_industry_sichuan_active.png"] forState:UIControlStateSelected];
        [sichuanButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:sichuanButton];
        
        hainanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [hainanButton setTag:5];
        [hainanButton setFrame:CGRectMake(619, 643, 35, 58)];
        [hainanButton setImage:[UIImage imageNamed:@"brand_industry_hainan.png"] forState:UIControlStateNormal];
        [hainanButton setImage:[UIImage imageNamed:@"brand_industry_hainan.png"] forState:UIControlStateHighlighted];
        [hainanButton setImage:[UIImage imageNamed:@"brand_industry_hainan_active.png"] forState:UIControlStateSelected];
        [hainanButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:hainanButton];
        
        tianjinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tianjinButton setTag:6];
        [tianjinButton setFrame:CGRectMake(703, 268, 35, 58)];
        [tianjinButton setImage:[UIImage imageNamed:@"brand_industry_tianjin.png"] forState:UIControlStateNormal];
        [tianjinButton setImage:[UIImage imageNamed:@"brand_industry_tianjin.png"] forState:UIControlStateHighlighted];
        [tianjinButton setImage:[UIImage imageNamed:@"brand_industry_tianjin_active.png"] forState:UIControlStateSelected];
        [tianjinButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:tianjinButton];
        
        shandongButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [shandongButton setTag:7];
        [shandongButton setFrame:CGRectMake(733, 325, 35, 58)];
        [shandongButton setImage:[UIImage imageNamed:@"brand_industry_shandong.png"] forState:UIControlStateNormal];
        [shandongButton setImage:[UIImage imageNamed:@"brand_industry_shandong.png"] forState:UIControlStateHighlighted];
        [shandongButton setImage:[UIImage imageNamed:@"brand_industry_shandong_active.png"] forState:UIControlStateSelected];
        [shandongButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:shandongButton];
        
        chongqingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [chongqingButton setTag:8];
        [chongqingButton setFrame:CGRectMake(614, 434, 35, 58)];
        [chongqingButton setImage:[UIImage imageNamed:@"brand_industry_chongqing.png"] forState:UIControlStateNormal];
        [chongqingButton setImage:[UIImage imageNamed:@"brand_industry_chongqing.png"] forState:UIControlStateHighlighted];
        [chongqingButton setImage:[UIImage imageNamed:@"brand_industry_chongqing_active.png"] forState:UIControlStateSelected];
        [chongqingButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:chongqingButton];
        
        liaoningButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [liaoningButton setTag:9];
        [liaoningButton setFrame:CGRectMake(822, 226, 35, 58)];
        [liaoningButton setImage:[UIImage imageNamed:@"brand_industry_liaoning.png"] forState:UIControlStateNormal];
        [liaoningButton setImage:[UIImage imageNamed:@"brand_industry_liaoning.png"] forState:UIControlStateHighlighted];
        [liaoningButton setImage:[UIImage imageNamed:@"brand_industry_liaoning_active.png"] forState:UIControlStateSelected];
        [liaoningButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:liaoningButton];
        
        jiangsuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [jiangsuButton setTag:10];
        [jiangsuButton setFrame:CGRectMake(762, 379, 35, 58)];
        [jiangsuButton setImage:[UIImage imageNamed:@"brand_industry_jiangsu.png"] forState:UIControlStateNormal];
        [jiangsuButton setImage:[UIImage imageNamed:@"brand_industry_jiangsu.png"] forState:UIControlStateHighlighted];
        [jiangsuButton setImage:[UIImage imageNamed:@"brand_industry_jiangsu_active.png"] forState:UIControlStateSelected];
        [jiangsuButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:jiangsuButton];
        
        hebeiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [hebeiButton setTag:11];
        [hebeiButton setFrame:CGRectMake(666, 310, 35, 58)];
        [hebeiButton setImage:[UIImage imageNamed:@"brand_industry_hebei.png"] forState:UIControlStateNormal];
        [hebeiButton setImage:[UIImage imageNamed:@"brand_industry_hebei.png"] forState:UIControlStateHighlighted];
        [hebeiButton setImage:[UIImage imageNamed:@"brand_industry_hebei_active.png"] forState:UIControlStateSelected];
        [hebeiButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:hebeiButton];
        
        beijingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [beijingButton setTag:12];
        [beijingButton setFrame:CGRectMake(675, 253, 35, 58)];
        [beijingButton setImage:[UIImage imageNamed:@"brand_industry_beijing.png"] forState:UIControlStateNormal];
        [beijingButton setImage:[UIImage imageNamed:@"brand_industry_beijing.png"] forState:UIControlStateHighlighted];
        [beijingButton setImage:[UIImage imageNamed:@"brand_industry_beijing_active.png"] forState:UIControlStateSelected];
        [beijingButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:beijingButton];
        
        guangdongButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [guangdongButton setTag:13];
        [guangdongButton setFrame:CGRectMake(678, 552, 35, 58)];
        [guangdongButton setImage:[UIImage imageNamed:@"brand_industry_guangdong.png"] forState:UIControlStateNormal];
        [guangdongButton setImage:[UIImage imageNamed:@"brand_industry_guangdong.png"] forState:UIControlStateHighlighted];
        [guangdongButton setImage:[UIImage imageNamed:@"brand_industry_guangdong_active.png"] forState:UIControlStateSelected];
        [guangdongButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:guangdongButton];
        
        jilingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [jilingButton setTag:13];
        [jilingButton setFrame:CGRectMake(809, 168, 35, 58)];
        [jilingButton setImage:[UIImage imageNamed:@"brand_industry_jiling.png"] forState:UIControlStateNormal];
        [jilingButton setImage:[UIImage imageNamed:@"brand_industry_jiling.png"] forState:UIControlStateHighlighted];
        [jilingButton setImage:[UIImage imageNamed:@"brand_industry_jiling_active.png"] forState:UIControlStateSelected];
        [jilingButton addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [menuView addSubview:jilingButton];
        
        maskLayer = [CALayer layer];
        maskLayer.frame = CGRectMake(675, 425, 5, 5);
        maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"mask"].CGImage);
        menuView.layer.mask = maskLayer;
        
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
        [menuItem0Button setFrame:CGRectMake(116, 601, 102, 63)];
        [menuItem0Button setImage:[UIImage imageNamed:@"brand_industry_menu_0.png"] forState:UIControlStateNormal];
        [menuItem0Button setImage:[UIImage imageNamed:@"brand_industry_menu_0_active.png"] forState:UIControlStateHighlighted];
        [menuItem0Button setImage:[UIImage imageNamed:@"brand_industry_menu_0_active.png"] forState:UIControlStateSelected];
        [menuItem0Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setAlpha:0.0];
        [menuItem1Button setTag:1];
        [menuItem1Button setFrame:CGRectMake(221, 601, 102, 63)];
        [menuItem1Button setImage:[UIImage imageNamed:@"brand_industry_menu_1.png"] forState:UIControlStateNormal];
        [menuItem1Button setImage:[UIImage imageNamed:@"brand_industry_menu_1_active.png"] forState:UIControlStateHighlighted];
        [menuItem1Button setImage:[UIImage imageNamed:@"brand_industry_menu_1_active.png"] forState:UIControlStateSelected];
        [menuItem1Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setAlpha:0.0];
        [menuItem2Button setTag:2];
        [menuItem2Button setFrame:CGRectMake(116, 666, 102, 63)];
        [menuItem2Button setImage:[UIImage imageNamed:@"brand_industry_menu_2.png"] forState:UIControlStateNormal];
        [menuItem2Button setImage:[UIImage imageNamed:@"brand_industry_menu_2_active.png"] forState:UIControlStateHighlighted];
        [menuItem2Button setImage:[UIImage imageNamed:@"brand_industry_menu_2_active.png"] forState:UIControlStateSelected];
        [menuItem2Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        menuItem3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem3Button setAlpha:0.0];
        [menuItem3Button setTag:3];
        [menuItem3Button setFrame:CGRectMake(221, 666, 102, 63)];
        [menuItem3Button setImage:[UIImage imageNamed:@"brand_industry_menu_3.png"] forState:UIControlStateNormal];
        [menuItem3Button setImage:[UIImage imageNamed:@"brand_industry_menu_3_active.png"] forState:UIControlStateHighlighted];
        [menuItem3Button setImage:[UIImage imageNamed:@"brand_industry_menu_3_active.png"] forState:UIControlStateSelected];
        [menuItem3Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem3Button];
        
        [self performSelector:@selector(showMenuItem0) withObject:nil afterDelay:0.5f];
        [self performSelector:@selector(showMenuItem1) withObject:nil afterDelay:1.0f];
        [self performSelector:@selector(showMenuItem2) withObject:nil afterDelay:1.5f];
        [self performSelector:@selector(showMenuItem3) withObject:nil afterDelay:2.0f];
        
        [self clickMenuItemButton:menuItem0Button];
    }
    return self;
}

- (void)showMenuItem0 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem0Button setAlpha:1.0];
    CGRect frame = menuItem0Button.frame;
    frame.origin.x = 66;
    [menuItem0Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenuItem1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem1Button setAlpha:1.0];
    CGRect frame = menuItem1Button.frame;
    frame.origin.x = 171;
    [menuItem1Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenuItem2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem2Button setAlpha:1.0];
    CGRect frame = menuItem2Button.frame;
    frame.origin.x = 66;
    [menuItem2Button setFrame:frame];
    [UIView commitAnimations];
}

- (void)showMenuItem3 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [menuItem3Button setAlpha:1.0];
    CGRect frame = menuItem3Button.frame;
    frame.origin.x = 171;
    [menuItem3Button setFrame:frame];
    [UIView setAnimationDidStopSelector:@selector(showMenu)];
    [UIView commitAnimations];
}

- (void)showMenu {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setDelegate:self];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 1.0;
    animation.repeatCount = 0;
    animation.autoreverses = NO;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:400.0];
    [maskLayer addAnimation:animation forKey:@"scale"];
}

- (void)clickMenuItemButton:(id)sender {
    selectIndex = (int) ((UIButton *)sender).tag;
    
    [menuItem0Button setSelected:NO];
    [menuItem1Button setSelected:NO];
    [menuItem2Button setSelected:NO];
    [menuItem3Button setSelected:NO];
    
    [neimengguButton setSelected:NO];
    [xinjianButton setSelected:NO];
    [gansuButton setSelected:NO];
    [hunanButton setSelected:NO];
    [sichuanButton setSelected:NO];
    [hainanButton setSelected:NO];
    [tianjinButton setSelected:NO];
    [shandongButton setSelected:NO];
    [chongqingButton setSelected:NO];
    [liaoningButton setSelected:NO];
    [jiangsuButton setSelected:NO];
    [hebeiButton setSelected:NO];
    [beijingButton setSelected:NO];
    [guangdongButton setSelected:NO];
    [jilingButton setSelected:NO];
    
    [neimengguImageView setAlpha:0.0];
    [xinjianImageView setAlpha:0.0];
    [gansuImageView setAlpha:0.0];
    [hunanImageView setAlpha:0.0];
    [sichuanImageView setAlpha:0.0];
    [hainanImageView setAlpha:0.0];
    [tianjinImageView setAlpha:0.0];
    [shandongImageView setAlpha:0.0];
    [chongqingImageView setAlpha:0.0];
    [liaoningImageView setAlpha:0.0];
    [jiangsuImageView setAlpha:0.0];
    [hebeiImageView setAlpha:0.0];
    [beijingImageView setAlpha:0.0];
    [guangdongImageView setAlpha:0.0];
    [jilingImageView setAlpha:0.0];
    
    if(selectIndex == 0) {
        [menuItem0Button setSelected:YES];
        
        [sichuanButton setSelected:YES];
        [hainanButton setSelected:YES];
        [tianjinButton setSelected:YES];
        [shandongButton setSelected:YES];
        [chongqingButton setSelected:YES];
        [liaoningButton setSelected:YES];
        [jiangsuButton setSelected:YES];
        [beijingButton setSelected:YES];
        
        [sichuanImageView setAlpha:0.5];
        [hainanImageView setAlpha:0.5];
        [tianjinImageView setAlpha:0.5];
        [shandongImageView setAlpha:0.5];
        [chongqingImageView setAlpha:0.5];
        [liaoningImageView setAlpha:0.5];
        [jiangsuImageView setAlpha:0.5];
        [beijingImageView setAlpha:0.5];
        
    } else if(selectIndex == 1) {
        [menuItem1Button setSelected:YES];
        
        [hunanButton setSelected:YES];
        [sichuanButton setSelected:YES];
        [hainanButton setSelected:YES];
        [tianjinButton setSelected:YES];
        [shandongButton setSelected:YES];
        [chongqingButton setSelected:YES];
        [liaoningButton setSelected:YES];
        [guangdongButton setSelected:YES];
        
        [hunanImageView setAlpha:0.5];
        [sichuanImageView setAlpha:0.5];
        [hainanImageView setAlpha:0.5];
        [tianjinImageView setAlpha:0.5];
        [shandongImageView setAlpha:0.5];
        [chongqingImageView setAlpha:0.5];
        [liaoningImageView setAlpha:0.5];
        [guangdongImageView setAlpha:0.5];
        
    } else if(selectIndex == 2) {
        [menuItem2Button setSelected:YES];
        
        [sichuanButton setSelected:YES];
        [hainanButton setSelected:YES];
        [hebeiButton setSelected:YES];
        //[jilingButton setSelected:YES];
        
        [sichuanImageView setAlpha:0.5];
        [hainanImageView setAlpha:0.5];
        [hebeiImageView setAlpha:0.5];
        //[jilingImageView setAlpha:0.5];
        
    } else if(selectIndex == 3) {
        [menuItem3Button setSelected:YES];
        
        [neimengguButton setSelected:YES];
        [xinjianButton setSelected:YES];
        [gansuButton setSelected:YES];
        [hebeiButton setSelected:YES];
        
        [neimengguImageView setAlpha:0.5];
        [xinjianImageView setAlpha:0.5];
        [gansuImageView setAlpha:0.5];
        [hebeiImageView setAlpha:0.5];
    }
}

- (void)clickMenuButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:NO];
}

- (void)clickCloseButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)cickSubMemuItemButton:(id)sender {
    if(selectIndex == -1) {
        return;
    }
    
    UIButton *button = (UIButton *)sender;
    
    if(button.selected) {
        int tag = (int) button.tag;
        
        BrandIndustryView *brandIndustryView = [[BrandIndustryView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) withFatherIndex:selectIndex withIndex:tag];
        [self.view addSubview:brandIndustryView];
    }
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
