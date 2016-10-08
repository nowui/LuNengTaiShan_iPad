//
//  BrandEstate3View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstate3View.h"

@interface BrandEstate3View () {
    UIImageView *backgroundImageView;
    UIImageView *alertImageView;
    UIImageView *titleImageView;
    UIImageView *noteImageView;
    CALayer *maskLayer;
    int selectIndex;
    BOOL isLoad;
}

@end

@implementation BrandEstate3View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        selectIndex = -1;
        isLoad = NO;
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setUserInteractionEnabled:YES];
        [backgroundImageView setImage:[UIImage imageNamed:@"brand_estate_3_bg.png"]];
        [self addSubview:backgroundImageView];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap:)];
        [backgroundImageView addGestureRecognizer:tapGestureRecognizer];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(51, 48, 277, 72)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:@"brand_estate_3_title.png"]];
        [self addSubview:titleImageView];
        
        noteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [noteImageView setImage:[UIImage imageNamed:@"brand_estate_3_note.png"]];
        [self addSubview:noteImageView];
        
        maskLayer = [CALayer layer];
        maskLayer.frame = CGRectMake(582, 415, 50, 50);
        maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"mask"].CGImage);
        noteImageView.layer.mask = maskLayer;
        
        UIButton *menu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu0Button setTag:0];
        [menu0Button setFrame:CGRectMake(263, 408, 108, 26)];
        [menu0Button addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu0Button];
        
        UIButton *menu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu1Button setTag:1];
        [menu1Button setFrame:CGRectMake(744, 417, 87, 26)];
        [menu1Button addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu1Button];
        
        UIButton *menu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu2Button setTag:2];
        [menu2Button setFrame:CGRectMake(690, 515, 117, 26)];
        [menu2Button addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu2Button];
        
        UIButton *menu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu3Button setTag:3];
        [menu3Button setFrame:CGRectMake(221, 469, 118, 26)];
        [menu3Button addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu3Button];
        
        UIButton *menu4Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu4Button setTag:4];
        [menu4Button setFrame:CGRectMake(803, 457, 118, 26)];
        [menu4Button addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu4Button];
        
        alertImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [alertImageView setAlpha:0.0];
        [self addSubview:alertImageView];
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
        
        [self performSelector:@selector(showNote) withObject:nil afterDelay:0.5f];
    }
}

-(void)clickTap:(UITapGestureRecognizer*)recognizer {
    selectIndex = -1;
    
    [alertImageView setAlpha:0.0];
}

- (void)clickMenuButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    if(selectIndex == tag) {
        selectIndex = -1;
        
        [alertImageView setAlpha:0.0];
    } else {
        selectIndex = tag;
        
        [alertImageView setAlpha:1.0];
        
        if(selectIndex == 0) {
            [alertImageView setFrame:CGRectMake(262, 164, 330, 234)];
        } else if(selectIndex == 1) {
            [alertImageView setFrame:CGRectMake(627, 178, 329, 236)];
        } else if(selectIndex == 2) {
            [alertImageView setFrame:CGRectMake(640, 285, 328, 226)];
        } else if(selectIndex == 3) {
            [alertImageView setFrame:CGRectMake(222, 226, 319, 231)];
        } else if(selectIndex == 4) {
            [alertImageView setFrame:CGRectMake(591, 233, 326, 217)];
        }
        
        [alertImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_3_menu_%d_bg.png", selectIndex]]];
    }
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
    animation.toValue = [NSNumber numberWithFloat:30.0];
    [maskLayer addAnimation:animation forKey:@"scale"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

@end
