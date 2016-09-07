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
    UIButton *leftButton;
    UIButton *rightButton;
}

@end

@implementation BrandEstate2View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        backgroundimageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundimageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_%d.png", 2]]];
        [self addSubview:backgroundimageView];
        
        leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setFrame:CGRectMake(512, 689, 27, 24)];
        [leftButton addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftButton];
        
        rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setFrame:CGRectMake(485, 77, 27, 24)];
        [rightButton addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightButton];
    }
    return self;
}

- (void)clickLeftButton:(id)sender {
    
}

- (void)clickRightButton:(id)sender {
    
}

@end
