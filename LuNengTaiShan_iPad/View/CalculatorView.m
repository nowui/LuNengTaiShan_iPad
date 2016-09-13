//
//  CalculatorView.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "CalculatorView.h"

@implementation CalculatorView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"calculator_bg.png"]];
        [self addSubview:backgroundImageView];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(878, 110, 40, 40)];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
    }
    return self;
}

- (void)clickCloseButton:(id)sender {
    [self removeFromSuperview];
}

@end
