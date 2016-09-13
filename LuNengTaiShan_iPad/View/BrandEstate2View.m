//
//  BrandEstate2View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstate2View.h"

@interface BrandEstate2View () {
    UIImageView *backgroundimageView;
    UIImageView *leftImageView;
    UIImageView *rightImageView;
    //UIImageView *leftHalfImageView;
    //UIImageView *rightHalfImageView;
    UIButton *leftButton;
    UIButton *rightButton;
    UIImageView *leftTextImageView;
    BOOL isLeft;
    BOOL isRight;
}

@end

@implementation BrandEstate2View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-512, 0, 1024, 768)];
        [leftImageView setImage:[UIImage imageNamed:@"brand_estate_2_left_bg.png"]];
        [self addSubview:leftImageView];
        
        rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(512, 0, 1024, 768)];
        [rightImageView setImage:[UIImage imageNamed:@"brand_estate_2_right_bg.png"]];
        [self addSubview:rightImageView];
        
        leftTextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-512, 0, 1024, 768)];
        [leftTextImageView setAlpha:0.0];
        [leftTextImageView setImage:[UIImage imageNamed:@"brand_estate_2_left_text.png"]];
        [self addSubview:leftTextImageView];
        
        /*leftHalfImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 512, 768)];
        [leftHalfImageView setImage:[UIImage imageNamed:@"brand_estate_2_left_half_bg.png"]];
        [self addSubview:leftHalfImageView];
        
        rightHalfImageView = [[UIImageView alloc] initWithFrame:CGRectMake(512, 0, 512, 768)];
        [rightHalfImageView setImage:[UIImage imageNamed:@"brand_estate_2_right_half_bg.png"]];
        [self addSubview:rightHalfImageView];*/
        
        backgroundimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundimageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_%d_bg.png", 2]]];
        [self addSubview:backgroundimageView];
        
        leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setFrame:CGRectMake(512, 689, 27, 24)];
        [leftButton addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setImage:[UIImage imageNamed:@"brand_estate_2_left_button.png"] forState:UIControlStateNormal];
        [self addSubview:leftButton];
        
        rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setFrame:CGRectMake(485, 77, 27, 24)];
        [rightButton addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setImage:[UIImage imageNamed:@"brand_estate_2_right_button.png"] forState:UIControlStateNormal];
        [self addSubview:rightButton];
    }
    return self;
}

- (void)clickLeftButton:(id)sender {
    if (isLeft) {
        isLeft = NO;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationDelegate:self];
        leftButton.frame = CGRectMake(512, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(485, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftImageView.frame = CGRectMake(-512, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(512, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        [UIView commitAnimations];
    } else {
        isLeft = YES;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationDelegate:self];
        leftButton.frame = CGRectMake(0, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(-rightButton.frame.size.width, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftImageView.frame = CGRectMake(-leftImageView.frame.size.width, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(0, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        [UIView commitAnimations];
    }
}

- (void)clickRightButton:(id)sender {
    if (isRight) {
        isRight = NO;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationDelegate:self];
        [leftTextImageView setAlpha:0.0];
        leftButton.frame = CGRectMake(512, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(485, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftImageView.frame = CGRectMake(-512, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(512, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        leftTextImageView.frame = CGRectMake(-512, leftTextImageView.frame.origin.y, leftTextImageView.frame.size.width, leftTextImageView.frame.size.height);
        [UIView commitAnimations];
        
    } else {
        isRight = YES;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationDelegate:self];
        [leftTextImageView setAlpha:1.0];
        leftButton.frame = CGRectMake(1024 + leftButton.frame.size.width, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(1024 - rightButton.frame.size.width, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftImageView.frame = CGRectMake(0, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(1024, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        leftTextImageView.frame = CGRectMake(0, leftTextImageView.frame.origin.y, leftTextImageView.frame.size.width, leftTextImageView.frame.size.height);
        [UIView commitAnimations];
    }
}

@end
