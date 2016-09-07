//
//  BrandEstate2View.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstate2View.h"

@implementation BrandEstate2View

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_%d.png", 2]]];
        [self addSubview:imageView];
    }
    return self;
}

@end
