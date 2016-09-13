//
//  RegionalTrafficView.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "RegionalTrafficView.h"

@interface RegionalTrafficView () <UIScrollViewDelegate> {
    UIImageView *backgroundImageView;
    int selectIndex;
}

@end

@implementation RegionalTrafficView

- (id)initWithFrame:(CGRect)frame withFatherIndex:(int)fatherIndex withIndex:(int)index {
    self = [super initWithFrame:frame];
    if (self) {
        selectIndex = -1;
        
        int total = 0;
        
        if(fatherIndex == 0) {
            if(index == 0) {
                total = 2;
            } else if(index == 1) {
                total = 2;
            } else if(index == 2) {
                total = 2;
            } else if(index == 3) {
                total = 2;
            } else if(index == 4) {
                total = 1;
            } else if(index == 5) {
                total = 2;
            }
        } else if(fatherIndex == 1) {
            if(index == 0) {
                total = 1;
            } else if(index == 1) {
                total = 1;
            } else if(index == 2) {
                total = 1;
            } else if(index == 3) {
                total = 1;
            } else if(index == 4) {
                total = 2;
            } else if(index == 5) {
                total = 1;
            } else if(index == 6) {
                total = 2;
            } else if(index == 7) {
                total = 1;
            } else if(index == 8) {
                total = 1;
            }
        } else if(fatherIndex == 2) {
            if(index == 0) {
                total = 2;
            } else if(index == 1) {
                total = 1;
            } else if(index == 2) {
                total = 1;
            }
        }
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"regional_traffic_detail_bg.png"]];
        [self addSubview:backgroundImageView];
        
        UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(166, 133, 704, 473)];
        [mainScrollView setDelegate:self];
        [mainScrollView setContentSize:CGSizeMake(704 * total, 473)];
        [mainScrollView setShowsHorizontalScrollIndicator:NO];
        [mainScrollView setShowsVerticalScrollIndicator:NO];
        [mainScrollView setPagingEnabled:YES];
        [self addSubview:mainScrollView];
        
        for(int i = 0; i < total; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(704 * i, 0, 704, 473)];
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"regional_traffic_%d_%d_%d_bg.png", fatherIndex, index, i]]];
            [mainScrollView addSubview:imageView];
        }
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(873, 138, 40, 40)];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
    }
    return self;
}

- (void)clickCloseButton:(id)sender {
    [self removeFromSuperview];
}

@end
