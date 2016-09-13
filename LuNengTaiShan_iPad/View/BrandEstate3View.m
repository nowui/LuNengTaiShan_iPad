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
    int selectIndex;
}

@end

@implementation BrandEstate3View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        selectIndex = -1;
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"brand_estate_3_bg.png"]];
        [self addSubview:backgroundImageView];
        
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
    }
    return self;
}

- (void)clickMenuButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    if(selectIndex == tag) {
        selectIndex = -1;
        
        [backgroundImageView setImage:[UIImage imageNamed:@"brand_estate_3_bg.png"]];
    } else {
        selectIndex = tag;
        
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_3_menu_%d_bg.png", selectIndex]]];
    }
}

@end
