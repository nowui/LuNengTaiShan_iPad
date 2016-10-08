//
//  ProjectIntroductionSportsParkView.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectIntroductionSportsParkView.h"

@interface ProjectIntroductionSportsParkView () {
    
}

@end

@implementation ProjectIntroductionSportsParkView

- (id)initWithFrame:(CGRect)frame withIndex:(int)index {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setUserInteractionEnabled:YES];
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_introduction_sports_park_%d_bg.png", index]]];
        [self addSubview:backgroundImageView];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap:)];
        [backgroundImageView addGestureRecognizer:tapGestureRecognizer];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(916, 158, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_mask_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
        
        [self setAlpha:0.0];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        [self setAlpha:1.0];
        [UIView commitAnimations];
    }
    return self;
}

-(void)clickTap:(UITapGestureRecognizer*)recognizer {
    [self hide];
}

- (void)clickCloseButton:(id)sender {
    [self hide];
}

- (void)hide {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [self setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(remove)];
    [UIView commitAnimations];
}

- (void)remove {
    [self removeFromSuperview];
}

@end
