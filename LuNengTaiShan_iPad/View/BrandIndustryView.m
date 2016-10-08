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
    UIPageControl *pageControl;
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
            if(index == 4) {
                total = 3;
            } else if(index == 5) {
                total = 6;
            } else if(index == 6) {
                total = 1;
            } else if(index == 7) {
                total = 4;
            } else if(index == 8) {
                total = 4;
            } else if(index == 9) {
                total = 1;
            } else if(index == 10) {
                total = 1;
            } else if(index == 12) {
                total = 4;
            }
        } else if(fatherIndex == 1) {
            if(index == 3) {
                total = 1;
            } else if(index == 4) {
                total = 3;
            } else if(index == 5) {
                total = 4;
            } else if(index == 6) {
                total = 1;
            } else if(index == 7) {
                total = 4;
            } else if(index == 9) {
                total = 1;
            } else if(index == 8) {
                total = 1;
            } else if(index == 12) {
                total = 4;
            } else if(index == 13) {
                total = 1;
            }
        } else if(fatherIndex == 2) {
            if(index == 4) {
                total = 1;
            } else if(index == 5) {
                total = 1;
            } else if(index == 11) {
                total = 1;
            } else if(index == 14) {
                total = 1;
            }
        } else if(fatherIndex == 3) {
            if(index == 0) {
                total = 1;
            } else if(index == 1) {
                total = 1;
            } else if(index == 2) {
                total = 1;
            } else if(index == 11) {
                total = 1;
            }
        }
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setUserInteractionEnabled:YES];
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_industry_detail_%d_bg.png", fatherIndex]]];
        [self addSubview:backgroundImageView];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap:)];
        [backgroundImageView addGestureRecognizer:tapGestureRecognizer];
        
        UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(152, 137, 719, 424)];
        [mainScrollView setDelegate:self];
        [mainScrollView setContentSize:CGSizeMake(719 * total, 424)];
        [mainScrollView setShowsHorizontalScrollIndicator:NO];
        [mainScrollView setShowsVerticalScrollIndicator:NO];
        [mainScrollView setPagingEnabled:YES];
        [self addSubview:mainScrollView];
        
        for(int i = 0; i < total; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(719 * i, 0, 719, 424)];
            [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_industry_detail_%d_%d_%d_bg.png", fatherIndex, index, i]]];
            [mainScrollView addSubview:imageView];
        }
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(871, 137, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_mask_close_2.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
        
        if(total > 1) {
            pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 533, 1024, 30)];
            [pageControl setNumberOfPages:total];
            [pageControl setCurrentPage:0];
            [pageControl setCurrentPageIndicatorTintColor:[UIColor blueColor]];
            [pageControl setPageIndicatorTintColor:[UIColor blackColor]];
            [pageControl setUserInteractionEnabled:NO];
            [pageControl setValue:[UIImage imageNamed:@"icon_3.png"] forKey:@"pageImage"];
            [pageControl setValue:[UIImage imageNamed:@"icon_2.png"] forKey:@"currentPageImage"];
            [self addSubview:pageControl];
        }
        
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    [pageControl setCurrentPage:index];
}

@end
