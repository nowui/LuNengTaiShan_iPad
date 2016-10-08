//
//  BrandEstate1View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/26/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstate1View.h"

@interface BrandEstate1View () {
    UIImageView *titleImageView;
    UIImageView *textImageView;
    UIImageView *noteImageView;
    CALayer *maskLayer;
    BOOL isLoad;
}

@end

@implementation BrandEstate1View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        isLoad = NO;
        
        UIImageView *backgroundimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundimageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_%d_bg.png", 1]]];
        [self addSubview:backgroundimageView];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(56, 54, 282, 73)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:@"brand_estate_1_title.png"]];
        [self addSubview:titleImageView];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 1024, 768)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:@"brand_estate_1_text.png"]];
        [self addSubview:textImageView];
        
        noteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [noteImageView setImage:[UIImage imageNamed:@"brand_estate_1_note.png"]];
        [self addSubview:noteImageView];
        
        maskLayer = [CALayer layer];
        maskLayer.frame = CGRectMake(689, 451, 50, 50);
        maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"mask"].CGImage);
        noteImageView.layer.mask = maskLayer;
    }
    return self;
}

- (void)play {
    if(! isLoad) {
        isLoad = YES;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0f];
        [UIView setAnimationDelegate:self];
        [titleImageView setAlpha:1.0];
        [UIView commitAnimations];
        
        [self performSelector:@selector(showText) withObject:nil afterDelay:0.5f];
    }
}

- (void)showText {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = textImageView.frame;
    frame.origin.x = 0;
    [textImageView setFrame:frame];
    [textImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showNote)];
    [UIView commitAnimations];
}

- (void)showNote {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setDelegate:self];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 1.0;
    animation.repeatCount = 0;
    animation.autoreverses = NO;
    animation.fillMode=kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:40.0];
    [maskLayer addAnimation:animation forKey:@"scale"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

@end
