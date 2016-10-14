//
//  ProjectIntroductionPlanning0View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/28/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectIntroductionPlanning0View.h"

@interface ProjectIntroductionPlanning0View () {
    UIImageView *titleImageView;
    UIImageView *textImageView;
    UIImageView *alertImageView;
    int selectIndex;
    BOOL isLoad;
}

@end

@implementation ProjectIntroductionPlanning0View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        selectIndex = -1;
        isLoad = NO;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setUserInteractionEnabled:YES];
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_introduction_planning_%d_bg.png", 0]]];
        [self addSubview:backgroundImageView];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap:)];
        [backgroundImageView addGestureRecognizer:tapGestureRecognizer];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(42, 677, 183, 68)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:@"project_introduction_planning_0_title.png"]];
        [self addSubview:titleImageView];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(368, 689, 422, 40)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:@"project_introduction_planning_0_text.png"]];
        [self addSubview:textImageView];
        
        alertImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [alertImageView setAlpha:0.0];
        [alertImageView setImage:[UIImage imageNamed:@"project_introduction_planning_0_text.png"]];
        [self addSubview:alertImageView];
        
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
        
        UIImageView *menuItem0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(392, 275, 23, 23)];
        //[menuItem0ImageView setAlpha:0.0];
        [menuItem0ImageView setImage:[UIImage imageNamed:@"project_introduction_planning_circle.png"]];
        [menuItem0ImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [self addSubview:menuItem0ImageView];
        
        UIImageView *menuItem1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(716, 493, 23, 23)];
        //[menuItem1ImageView setAlpha:0.0];
        [menuItem1ImageView setImage:[UIImage imageNamed:@"project_introduction_planning_circle.png"]];
        [menuItem1ImageView.layer addAnimation:circleAnimation forKey:@"circleAnimation"];
        [self addSubview:menuItem1ImageView];
        
        UIButton *menuItem0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem0Button setTag:0];
        [menuItem0Button setFrame:CGRectMake(382, 265, 50, 50)];
        [menuItem0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuItem0Button];
        
        UIButton *menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setFrame:CGRectMake(704, 478, 50, 50)];
        [menuItem1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuItem1Button];
    }
    return self;
}

-(void)clickTap:(UITapGestureRecognizer*)recognizer {
    selectIndex = -1;
    
    [alertImageView setAlpha:0.0];
}

- (void)play {
    if(! isLoad) {
        isLoad = YES;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        [titleImageView setAlpha:1.0];
        [UIView commitAnimations];
        
        [self performSelector:@selector(showText) withObject:nil afterDelay:0.25f];
    }
}

- (void)showText {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = textImageView.frame;
    frame.origin.x = 268;
    [textImageView setFrame:frame];
    [textImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)cickSubMemuItemButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    selectIndex = tag;
    
    [alertImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_introduction_planning_0_mask_%d.png", selectIndex]]];
    [alertImageView setAlpha:1.0];
}

@end
