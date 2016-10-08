//
//  BrandEstateViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandEstateViewController.h"
#import "BrandEstate0View.h"
#import "BrandEstate1View.h"
#import "BrandEstate2View.h"
#import "BrandEstate3View.h"
#import "BrandEstate4View.h"

@interface BrandEstateViewController () <UIScrollViewDelegate> {
    CATransition *transition;
    UIPageControl *pageControl;
    BrandEstate0View *brandEstate0View;
    BrandEstate1View *brandEstate1View;
    BrandEstate2View *brandEstate2View;
    BrandEstate3View *brandEstate3View;
    BrandEstate4View *brandEstate4View;
}

@end

@implementation BrandEstateViewController

- (id)init {
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:[UIColor blackColor]];
        
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [mainScrollView setDelegate:self];
        [mainScrollView setContentSize:CGSizeMake(1024 * 5, 768)];
        [mainScrollView setShowsHorizontalScrollIndicator:NO];
        [mainScrollView setShowsVerticalScrollIndicator:NO];
        [mainScrollView setPagingEnabled:YES];
        [self.view addSubview:mainScrollView];
        
        brandEstate0View = [[BrandEstate0View alloc] initWithFrame:CGRectMake(1024 * 0, 0, 1024, 768)];
        [mainScrollView addSubview:brandEstate0View];
        
        brandEstate2View = [[BrandEstate2View alloc] initWithFrame:CGRectMake(1024 * 2, 0, 1024, 768)];
        [mainScrollView addSubview:brandEstate2View];
        
        brandEstate1View = [[BrandEstate1View alloc] initWithFrame:CGRectMake(1024 * 1, 0, 1024, 768)];
        [mainScrollView addSubview:brandEstate1View];
        
        brandEstate3View = [[BrandEstate3View alloc] initWithFrame:CGRectMake(1024 * 3, 0, 1024, 768)];
        [mainScrollView addSubview:brandEstate3View];
        
        brandEstate4View = [[BrandEstate4View alloc] initWithFrame:CGRectMake(1024 * 4, 0, 1024, 768)];
        [mainScrollView addSubview:brandEstate4View];
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(923, 15, 50, 50)];
        [menuButton setImage:[UIImage imageNamed:@"button_menu.png"] forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(962, 15, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 738, 1024, 30)];
        [pageControl setNumberOfPages:5];
        [pageControl setCurrentPage:0];
        [pageControl setCurrentPageIndicatorTintColor:[UIColor blueColor]];
        [pageControl setPageIndicatorTintColor:[UIColor blackColor]];
        [pageControl setUserInteractionEnabled:NO];
        [pageControl setValue:[UIImage imageNamed:@"icon_1.png"] forKey:@"pageImage"];
        [pageControl setValue:[UIImage imageNamed:@"icon_0.png"] forKey:@"currentPageImage"];
        [self.view addSubview:pageControl];
        
        [self performSelector:@selector(play) withObject:nil afterDelay:1.5f];
    }
    return self;
}

- (void)play {
    [brandEstate0View play];
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    [pageControl setCurrentPage:index];
    
    if (index == 0) {
        [brandEstate0View play];
    } else if(index == 1) {
        [brandEstate1View play];
    } else if(index == 2) {
        
    } else if(index == 3) {
        [brandEstate3View play];
    } else if(index == 4) {
        [brandEstate4View play];
    }
}

@end
