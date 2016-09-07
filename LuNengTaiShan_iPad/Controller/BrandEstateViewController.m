//
//  BrandEstateViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstateViewController.h"
#import "BrandEstate2View.h"

@interface BrandEstateViewController () <UIScrollViewDelegate> {
    CATransition *transition;
}

@end

@implementation BrandEstateViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [mainScrollView setDelegate:self];
        [mainScrollView setContentSize:CGSizeMake(1024 * 5, 768)];
        [mainScrollView setShowsHorizontalScrollIndicator:NO];
        [mainScrollView setShowsVerticalScrollIndicator:NO];
        [mainScrollView setPagingEnabled:YES];
        [self.view addSubview:mainScrollView];
        
        for(int i = 0; i < 5; i++) {
            if(i == 2) {
                BrandEstate2View *brandEstate2View = [[BrandEstate2View alloc] initWithFrame:CGRectMake(1024 * i, 0, 1024, 768)];
                [mainScrollView addSubview:brandEstate2View];
            } else {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(1024 * i, 0, 1024, 768)];
                [mainScrollView addSubview:view];
                
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_estate_%d.png", i]]];
                [view addSubview:imageView];
            }
        }
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(923, 15, 40, 40)];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(962, 15, 40, 40)];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
    }
    return self;
}

- (void)clickMenuButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:NO];
}

- (void)clickCloseButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
