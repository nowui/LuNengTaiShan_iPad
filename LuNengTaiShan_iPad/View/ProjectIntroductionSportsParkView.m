//
//  ProjectIntroductionSportsParkView.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectIntroductionSportsParkView.h"

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
        [closButton setFrame:CGRectMake(864, 200, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_mask_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
    }
    return self;
}

-(void)clickTap:(UITapGestureRecognizer*)recognizer {
    [self removeFromSuperview];
}

- (void)clickCloseButton:(id)sender {
    [self removeFromSuperview];
}

@end
