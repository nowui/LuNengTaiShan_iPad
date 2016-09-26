//
//  ProjectViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectIntroductionViewController.h"
#import "ProjectHouseViewController.h"
#import "ProjectLandscapeViewController.h"

@interface ProjectViewController () {
    CATransition *transition;
    UIButton *introductionButton;
    UIButton *houseButton;
    UIButton *landscapeButton;
}

@end

@implementation ProjectViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"project_bg.png"]];
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
        
        introductionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [introductionButton setAlpha:0.0];
        [introductionButton setFrame:CGRectMake(227, 302, 237, 155)];
        [introductionButton setImage:[UIImage imageNamed:@"project_menu_0.png"] forState:UIControlStateNormal];
        [introductionButton setImage:[UIImage imageNamed:@"project_menu_0_active.png"] forState:UIControlStateHighlighted];
        [introductionButton addTarget:self action:@selector(clickIntroductionButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:introductionButton];
        
        [self performSelector:@selector(showIntroduction) withObject:nil afterDelay:0.5f];
        
        houseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [houseButton setAlpha:0.0];
        [houseButton setFrame:CGRectMake(539, 302, 143, 155)];
        [houseButton setImage:[UIImage imageNamed:@"project_menu_1.png"] forState:UIControlStateNormal];
        [houseButton setImage:[UIImage imageNamed:@"project_menu_1_active.png"] forState:UIControlStateHighlighted];
        [houseButton addTarget:self action:@selector(clickHouseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:houseButton];
        
        [self performSelector:@selector(showHouse) withObject:nil afterDelay:1.0f];
        
        landscapeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [landscapeButton setAlpha:0.0];
        [landscapeButton setFrame:CGRectMake(809, 302, 143, 155)];
        [landscapeButton setImage:[UIImage imageNamed:@"project_menu_2.png"] forState:UIControlStateNormal];
        [landscapeButton setImage:[UIImage imageNamed:@"project_menu_2_active.png"] forState:UIControlStateHighlighted];
        [landscapeButton addTarget:self action:@selector(clickLandscapeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:landscapeButton];
        
        [self performSelector:@selector(showLandscape) withObject:nil afterDelay:1.5f];
    }
    return self;
}

- (void)showIntroduction {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = introductionButton.frame;
    frame.origin.x = 127;
    [introductionButton setFrame:frame];
    [introductionButton setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showHouse {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = houseButton.frame;
    frame.origin.x = 439;
    [houseButton setFrame:frame];
    [houseButton setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showLandscape {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = landscapeButton.frame;
    frame.origin.x = 709;
    [landscapeButton setFrame:frame];
    [landscapeButton setAlpha:1.0];
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

- (void)clickIntroductionButton:(id)sender {
    ProjectIntroductionViewController *projectIntroductionViewController = [[ProjectIntroductionViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectIntroductionViewController animated:NO];
}

- (void)clickHouseButton:(id)sender {
    ProjectHouseViewController *projectHouseViewController = [[ProjectHouseViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectHouseViewController animated:NO];
}

- (void)clickLandscapeButton:(id)sender {
    ProjectLandscapeViewController *projectLandscapeViewController = [[ProjectLandscapeViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectLandscapeViewController animated:NO];
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
