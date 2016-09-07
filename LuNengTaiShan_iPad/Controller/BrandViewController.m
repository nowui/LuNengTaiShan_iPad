//
//  BrandViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandViewController.h"
#import "BrandEstateViewController.h"
#import "BrandIndustryViewController.h"
#import "BrandSportViewController.h"

@interface BrandViewController () {
    CATransition *transition;
}

@end

@implementation BrandViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"brand_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(0, 0, 85, 85)];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(946, 21, 50, 50)];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
        
        UIButton *estateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [estateButton setFrame:CGRectMake(135, 319, 189, 156)];
        [estateButton addTarget:self action:@selector(clickEstateButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:estateButton];
        
        UIButton *industryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [industryButton setFrame:CGRectMake(397, 319, 204, 156)];
        [industryButton addTarget:self action:@selector(clickIndustryButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:industryButton];
        
        UIButton *sportButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sportButton setFrame:CGRectMake(702, 319, 163, 156)];
        [sportButton addTarget:self action:@selector(clickSportButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sportButton];
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

- (void)clickEstateButton:(id)sender {
    BrandEstateViewController *brandEstateViewController = [[BrandEstateViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:brandEstateViewController animated:NO];
}

- (void)clickIndustryButton:(id)sender {
    BrandIndustryViewController *brandIndustryViewController = [[BrandIndustryViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:brandIndustryViewController animated:NO];
}

- (void)clickSportButton:(id)sender {
    BrandSportViewController *brandSportViewController = [[BrandSportViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:brandSportViewController animated:NO];
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
