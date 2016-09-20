//
//  BrandIndustryView.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandIndustryView.h"

@interface BrandIndustryView () <UIScrollViewDelegate> {
    UIImageView *backgroundImageView;
    int selectndex;
}

@end

@implementation BrandIndustryView

- (id)initWithFrame:(CGRect)frame withFatherIndex:(int)fatherIndex withIndex:(int)index {
    self = [super initWithFrame:frame];
    if (self) {
        selectndex = -1;
        
        int total = 0;
        
        if(fatherIndex == 0) {
            if(index == 0) {
                total = 1;
            } else if(index == 1) {
                total = 4;
            } else if(index == 2) {
                total = 3;
            } else if(index == 3) {
                total = 1;
            } else if(index == 4) {
                total = 6;
            } else if(index == 5) {
                total = 4;
            } else if(index == 6) {
                total = 1;
            } else if(index == 7) {
                total = 1;
            } else if(index == 8) {
                total = 4;
            }
        } else if(fatherIndex == 1) {
            if(index == 0) {
                total = 1;
            } else if(index == 1) {
                total = 1;
            } else if(index == 2) {
                total = 4;
            } else if(index == 3) {
                total = 1;
            } else if(index == 4) {
                total = 4;
            } else if(index == 5) {
                total = 3;
            } else if(index == 6) {
                total = 1;
            } else if(index == 7) {
                total = 1;
            }
        } else if(fatherIndex == 2) {
            if(index == 0) {
                total = 1;
            } else if(index == 1) {
                total = 1;
            } else if(index == 2) {
                total = 1;
            } else if(index == 3) {
                total = 1;
            }
        } else if(fatherIndex == 3) {
            if(index == 0) {
                total = 1;
            } else if(index == 1) {
                total = 1;
            } else if(index == 2) {
                total = 1;
            } else if(index == 3) {
                total = 1;
            }
        }
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"brand_industry_detail_bg.png"]];
        [self addSubview:backgroundImageView];
        
        UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(152, 137, 719, 424)];
        [mainScrollView setDelegate:self];
        [mainScrollView setContentSize:CGSizeMake(719 * total, 424)];
        [mainScrollView setShowsHorizontalScrollIndicator:NO];
        [mainScrollView setShowsVerticalScrollIndicator:NO];
        [mainScrollView setPagingEnabled:YES];
        [self addSubview:mainScrollView];
        
        for(int i = 0; i < total; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(719 * i, 0, 719, 424)];
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_industry_%d_%d_%d_bg.png", fatherIndex, index, i]]];
            [mainScrollView addSubview:imageView];
        }
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(873, 138, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_mask_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
    }
    return self;
}

- (void)clickCloseButton:(id)sender {
    [self removeFromSuperview];
}

@end
