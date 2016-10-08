//
//  ProjectIntroductionPlanningViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectIntroductionPlanningViewController.h"
#import "ProjectIntroductionPlanning0View.h"
#import "ProjectIntroductionPlanning1View.h"
#import "ProjectIntroductionPlanning2View.h"
#import "ProjectIntroductionPlanning3View.h"
#import "ProjectIntroductionPlanning4View.h"
#import "ProjectIntroductionPlanning5View.h"

@interface ProjectIntroductionPlanningViewController () <UIScrollViewDelegate> {
    CATransition *transition;
    UIImageView *backgroundImageView;
    UIPageControl *pageControl;
    ProjectIntroductionPlanning0View *projectIntroductionPlanning0View;
    ProjectIntroductionPlanning1View *projectIntroductionPlanning1View;
    ProjectIntroductionPlanning2View *projectIntroductionPlanning2View;
    ProjectIntroductionPlanning3View *projectIntroductionPlanning3View;
    ProjectIntroductionPlanning4View *projectIntroductionPlanning4View;
    ProjectIntroductionPlanning5View *projectIntroductionPlanning5View;
    int selectIndex;
}

@end

@implementation ProjectIntroductionPlanningViewController

- (id)init {
    self = [super init];
    if (self) {
        selectIndex = -1;
        
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [mainScrollView setDelegate:self];
        [mainScrollView setContentSize:CGSizeMake(1024 * 6, 768)];
        [mainScrollView setShowsHorizontalScrollIndicator:NO];
        [mainScrollView setShowsVerticalScrollIndicator:NO];
        [mainScrollView setPagingEnabled:YES];
        [self.view addSubview:mainScrollView];
        
        projectIntroductionPlanning0View = [[ProjectIntroductionPlanning0View alloc] initWithFrame:CGRectMake(1024 * 0, 0, 1024, 768)];
        [mainScrollView addSubview:projectIntroductionPlanning0View];
        
        projectIntroductionPlanning1View = [[ProjectIntroductionPlanning1View alloc] initWithFrame:CGRectMake(1024 * 1, 0, 1024, 768)];
        [mainScrollView addSubview:projectIntroductionPlanning1View];
        
        projectIntroductionPlanning2View = [[ProjectIntroductionPlanning2View alloc] initWithFrame:CGRectMake(1024 * 2, 0, 1024, 768)];
        [mainScrollView addSubview:projectIntroductionPlanning2View];
        
        projectIntroductionPlanning3View = [[ProjectIntroductionPlanning3View alloc] initWithFrame:CGRectMake(1024 * 3, 0, 1024, 768)];
        [mainScrollView addSubview:projectIntroductionPlanning3View];
        
        projectIntroductionPlanning4View = [[ProjectIntroductionPlanning4View alloc] initWithFrame:CGRectMake(1024 * 4, 0, 1024, 768)];
        [mainScrollView addSubview:projectIntroductionPlanning4View];
        
        projectIntroductionPlanning5View = [[ProjectIntroductionPlanning5View alloc] initWithFrame:CGRectMake(1024 * 5, 0, 1024, 768)];
        [mainScrollView addSubview:projectIntroductionPlanning5View];
        
        
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
        [pageControl setNumberOfPages:6];
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
    [projectIntroductionPlanning0View play];
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
        [projectIntroductionPlanning0View play];
    } else if(index == 1) {
        [projectIntroductionPlanning1View play];
    } else if(index == 2) {
        [projectIntroductionPlanning2View play];
    } else if(index == 3) {
        [projectIntroductionPlanning3View play];
    } else if(index == 4) {
        [projectIntroductionPlanning4View play];
    } else if(index == 5) {
        [projectIntroductionPlanning5View play];
    }
}

@end
