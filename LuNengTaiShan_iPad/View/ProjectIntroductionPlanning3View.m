//
//  ProjectIntroductionPlanning3View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/28/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectIntroductionPlanning3View.h"

@interface ProjectIntroductionPlanning3View () {
    UIImageView *titleImageView;
    UIImageView *textImageView;
    BOOL isLoad;
}

@end

@implementation ProjectIntroductionPlanning3View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        isLoad = NO;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_introduction_planning_%d_bg.png", 3]]];
        [self addSubview:backgroundImageView];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(57, 32, 240, 77)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:@"project_introduction_planning_3_title.png"]];
        [self addSubview:titleImageView];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(882, 491, 225, 66)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:@"project_introduction_planning_3_text.png"]];
        [self addSubview:textImageView];
    }
    return self;
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
    frame.origin.x = 782;
    [textImageView setFrame:frame];
    [textImageView setAlpha:1.0];
    [UIView commitAnimations];
}

@end
