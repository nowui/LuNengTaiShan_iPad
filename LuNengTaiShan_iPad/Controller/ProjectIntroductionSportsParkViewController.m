//
//  ProjectIntroductionSportsParkViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectIntroductionSportsParkViewController.h"
#import "ProjectIntroductionSportsParkView.h"
#import "SportParkViewController.h"

@interface ProjectIntroductionSportsParkViewController () {
    CATransition *transition;
}

@end

@implementation ProjectIntroductionSportsParkViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"project_introduction_sports_park_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
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
        
        UIButton *menuItem0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem0Button setTag:1];
        [menuItem0Button setFrame:CGRectMake(196, 326, 145, 38)];
        [menuItem0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        UIButton *menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:2];
        [menuItem1Button setFrame:CGRectMake(573, 392, 145, 38)];
        [menuItem1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        UIButton *menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:0];
        [menuItem2Button setFrame:CGRectMake(703, 221, 145, 38)];
        [menuItem2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
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

- (void)cickSubMemuItemButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    if(tag == 2) {
        SportParkViewController *sportParkViewController = [[SportParkViewController alloc] init];
        [[self navigationController] pushViewController:sportParkViewController animated:NO];
    } else {
        ProjectIntroductionSportsParkView *projectIntroductionSportsParkView = [[ProjectIntroductionSportsParkView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) withIndex:tag];
        [self.view addSubview:projectIntroductionSportsParkView];
    }
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
