//
//  BrandEstate2View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstate2View.h"

@interface BrandEstate2View () {
    //UIImageView *backgroundimageView;
    UIImageView *leftImageView;
    UIImageView *rightImageView;
    UIButton *leftButton;
    UIButton *rightButton;
    UIView *leftView;
    UIView *rightView;
    UIImageView *leftTitleImageView;
    UIImageView *leftTextImageView;
    UIImageView *rightTitleImageView;
    UIImageView *rightTextImageView;
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
        
        leftTitleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [leftTitleImageView setAlpha:0.0];
        [leftTitleImageView setImage:[UIImage imageNamed:@"brand_estate_2_left_title.png"]];
        [self addSubview:leftTitleImageView];
        
        leftTextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [leftTextImageView setAlpha:0.0];
        [leftTextImageView setImage:[UIImage imageNamed:@"brand_estate_2_left_text.png"]];
        [self addSubview:leftTextImageView];
        
        rightTitleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [rightTitleImageView setAlpha:0.0];
        [rightTitleImageView setImage:[UIImage imageNamed:@"brand_estate_2_right_title.png"]];
        [self addSubview:rightTitleImageView];
        
        rightTextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [rightTextImageView setAlpha:0.0];
        [rightTextImageView setImage:[UIImage imageNamed:@"brand_estate_2_right_text.png"]];
        [self addSubview:rightTextImageView];
        
        /*backgroundimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundimageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_%d_bg.png", 2]]];
        [self addSubview:backgroundimageView];*/
        
        leftView = [[UIView alloc] initWithFrame:CGRectMake(512, 689, 27, 24)];
        [leftView setBackgroundColor:[UIColor colorWithRed:25.0f/255.0f green:37.0f/255.0f blue:63.0f/255.0f alpha:1.0]];
        [self addSubview:leftView];
        
        leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setFrame:CGRectMake(512, 689, 27, 24)];
        [leftButton addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setImage:[UIImage imageNamed:@"brand_estate_2_left_button.png"] forState:UIControlStateNormal];
        [self addSubview:leftButton];
        
        rightView = [[UIView alloc] initWithFrame:CGRectMake(485, 77, 27, 24)];
        [rightView setBackgroundColor:[UIColor colorWithRed:25.0f/255.0f green:37.0f/255.0f blue:63.0f/255.0f alpha:1.0]];
        [self addSubview:rightView];
        
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
        [rightTitleImageView setAlpha:0.0];
        [rightTextImageView setAlpha:0.0];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        leftButton.frame = CGRectMake(512, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(485, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftView.frame = CGRectMake(512, leftView.frame.origin.y, leftView.frame.size.width, leftView.frame.size.height);
        rightView.frame = CGRectMake(485, rightView.frame.origin.y, rightView.frame.size.width, rightView.frame.size.height);
        leftImageView.frame = CGRectMake(-512, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(512, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        [UIView setAnimationDidStopSelector:@selector(rotationLeft)];
        [UIView commitAnimations];
    } else {
        isLeft = YES;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        leftButton.frame = CGRectMake(0, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(-rightButton.frame.size.width, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftView.frame = CGRectMake(0, leftView.frame.origin.y, leftView.frame.size.width, leftView.frame.size.height);
        rightView.frame = CGRectMake(-rightView.frame.size.width, rightView.frame.origin.y, rightView.frame.size.width, rightView.frame.size.height);
        leftImageView.frame = CGRectMake(-leftImageView.frame.size.width, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(0, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        [UIView setAnimationDidStopSelector:@selector(rotationLeft)];
        [UIView commitAnimations];
    }
}

- (void)rotationLeft {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [animation setDelegate:self];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 0.5f;
    animation.repeatCount = 0;
    animation.autoreverses = NO;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    if(isLeft) {
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat:M_PI];
    } else {
        animation.fromValue = [NSNumber numberWithFloat:M_PI];
        animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    }
    [leftButton.layer addAnimation:animation forKey:@"rotation"];
    
    if (isLeft) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        [rightTitleImageView setAlpha:1.0];
        [UIView setAnimationDidStopSelector:@selector(showLeftText)];
        [UIView commitAnimations];
    }
}

- (void)showLeftText {
    [rightTextImageView setFrame:CGRectMake(100, 0, 1024, 768)];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = rightTextImageView.frame;
    frame.origin.x = 0;
    [rightTextImageView setFrame:frame];
    [rightTextImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)rotationRight {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [animation setDelegate:self];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 0.5f;
    animation.repeatCount = 0;
    animation.autoreverses = NO;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    if(isRight) {
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat:M_PI];
    } else {
        animation.fromValue = [NSNumber numberWithFloat:M_PI];
        animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    }
    [rightButton.layer addAnimation:animation forKey:@"rotation"];
    
    if (isRight) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        [leftTitleImageView setAlpha:1.0];
        [UIView setAnimationDidStopSelector:@selector(showRightText)];
        [UIView commitAnimations];
    }
}

- (void)showRightText {
    [leftTextImageView setFrame:CGRectMake(100, 0, 1024, 768)];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = leftTextImageView.frame;
    frame.origin.x = 0;
    [leftTextImageView setFrame:frame];
    [leftTextImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)clickRightButton:(id)sender {
    if (isRight) {
        isRight = NO;
        [leftTitleImageView setAlpha:0.0];
        [leftTextImageView setAlpha:0.0];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        leftButton.frame = CGRectMake(512, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(485, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftView.frame = CGRectMake(512, leftView.frame.origin.y, leftView.frame.size.width, leftView.frame.size.height);
        rightView.frame = CGRectMake(485, rightView.frame.origin.y, rightView.frame.size.width, rightView.frame.size.height);
        leftImageView.frame = CGRectMake(-512, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(512, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        //leftTitleImageView.frame = CGRectMake(-512, leftTitleImageView.frame.origin.y, leftTitleImageView.frame.size.width, leftTitleImageView.frame.size.height);
        //leftTextImageView.frame = CGRectMake(-512, leftTextImageView.frame.origin.y, leftTextImageView.frame.size.width, leftTextImageView.frame.size.height);
        [UIView setAnimationDidStopSelector:@selector(rotationRight)];
        [UIView commitAnimations];
        
    } else {
        isRight = YES;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationDelegate:self];
        leftButton.frame = CGRectMake(1024 + leftButton.frame.size.width, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
        rightButton.frame = CGRectMake(1024 - rightButton.frame.size.width, rightButton.frame.origin.y, rightButton.frame.size.width, rightButton.frame.size.height);
        leftView.frame = CGRectMake(1024 + leftView.frame.size.width, leftView.frame.origin.y, leftView.frame.size.width, leftView.frame.size.height);
        rightView.frame = CGRectMake(1024 - rightView.frame.size.width, rightView.frame.origin.y, rightView.frame.size.width, rightView.frame.size.height);
        leftImageView.frame = CGRectMake(0, leftImageView.frame.origin.y, leftImageView.frame.size.width, leftImageView.frame.size.height);
        rightImageView.frame = CGRectMake(1024, rightImageView.frame.origin.y, rightImageView.frame.size.width, rightImageView.frame.size.height);
        //leftTitleImageView.frame = CGRectMake(0, leftTitleImageView.frame.origin.y, leftTitleImageView.frame.size.width, leftTitleImageView.frame.size.height);
        //leftTextImageView.frame = CGRectMake(0, leftTextImageView.frame.origin.y, leftTextImageView.frame.size.width, leftTextImageView.frame.size.height);
        [UIView setAnimationDidStopSelector:@selector(rotationRight)];
        [UIView commitAnimations];
    }
}

@end
