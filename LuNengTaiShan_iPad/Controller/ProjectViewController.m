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
}

@end

@implementation ProjectViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
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
        
        UIButton *introductionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [introductionButton setFrame:CGRectMake(126, 319, 206, 156)];
        [introductionButton addTarget:self action:@selector(clickIntroductionButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:introductionButton];
        
        UIButton *houseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [houseButton setFrame:CGRectMake(441, 319, 148, 156)];
        [houseButton addTarget:self action:@selector(clickHouseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:houseButton];
        
        UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [landscapeButton setFrame:CGRectMake(708, 319, 148, 156)];
        [landscapeButton addTarget:self action:@selector(clickLandscapeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:landscapeButton];
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
