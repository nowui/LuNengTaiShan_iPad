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
    UIButton *estateButton;
    UIButton *industryButton;
    UIButton *sportButton;
}

@end

@implementation BrandViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"brand_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(0, 0, 85, 85)];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(946, 21, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
        
        estateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [estateButton setAlpha:0.0];
        [estateButton setFrame:CGRectMake(242, 320, 208, 154)];
        [estateButton setImage:[UIImage imageNamed:@"brand_menu_0.png"] forState:UIControlStateNormal];
        [estateButton setImage:[UIImage imageNamed:@"brand_menu_0_active.png"] forState:UIControlStateHighlighted];
        [estateButton addTarget:self action:@selector(clickEstateButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:estateButton];
        
        [self performSelector:@selector(showEstate) withObject:nil afterDelay:0.5f];
        
        industryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [industryButton setAlpha:0.0];
        [industryButton setFrame:CGRectMake(498, 320, 235, 154)];
        [industryButton setImage:[UIImage imageNamed:@"brand_menu_1.png"] forState:UIControlStateNormal];
        [industryButton setImage:[UIImage imageNamed:@"brand_menu_1_active.png"] forState:UIControlStateHighlighted];
        [industryButton addTarget:self action:@selector(clickIndustryButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:industryButton];
        
        [self performSelector:@selector(showIndustry) withObject:nil afterDelay:1.0f];
        
        sportButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sportButton setAlpha:0.0];
        [sportButton setFrame:CGRectMake(805, 320, 155, 154)];
        [sportButton setImage:[UIImage imageNamed:@"brand_menu_2.png"] forState:UIControlStateNormal];
        [sportButton setImage:[UIImage imageNamed:@"brand_menu_2_active.png"] forState:UIControlStateHighlighted];
        [sportButton addTarget:self action:@selector(clickSportButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:sportButton];
        
        [self performSelector:@selector(showSport) withObject:nil afterDelay:1.5f];
    }
    return self;
}

- (void)showEstate {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = estateButton.frame;
    frame.origin.x = 142;
    [estateButton setFrame:frame];
    [estateButton setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showIndustry {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = industryButton.frame;
    frame.origin.x = 398;
    [industryButton setFrame:frame];
    [industryButton setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showSport {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = sportButton.frame;
    frame.origin.x = 705;
    [sportButton setFrame:frame];
    [sportButton setAlpha:1.0];
    [UIView commitAnimations];
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
