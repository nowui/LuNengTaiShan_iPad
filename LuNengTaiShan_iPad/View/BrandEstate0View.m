//
//  BrandEstate0View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/26/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstate0View.h"

@interface BrandEstate0View () {
    UIImageView *titleImageView;
    UIImageView *textImageView;
    BOOL isLoad;
}

@end

@implementation BrandEstate0View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        isLoad = NO;
        
        UIImageView *backgroundimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundimageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_%d_bg.png", 0]]];
        [self addSubview:backgroundimageView];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(72, 560, 232, 68)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:@"brand_estate_0_title.png"]];
        [self addSubview:titleImageView];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(172, 648, 569, 83)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:@"brand_estate_0_text.png"]];
        [self addSubview:textImageView];
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
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [textImageView setAlpha:1.0];
    CGRect frame = textImageView.frame;
    frame.origin.x = 72;
    [textImageView setFrame:frame];
    [UIView commitAnimations];
}

@end
