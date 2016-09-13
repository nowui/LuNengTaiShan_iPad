//
//  ProjectIntroductionViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectIntroductionViewController.h"
#import "ProjectIntroductionSportsParkViewController.h"
#import "ProjectIntroductionPlanningViewController.h"
#import "ProjectIntroductionBusinessViewController.h"

@interface ProjectIntroductionViewController () {
    CATransition *transition;
}

@end

@implementation ProjectIntroductionViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"project_introduction_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(923, 15, 40, 40)];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(962, 15, 40, 40)];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
        
        UIButton *menuItem0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem0Button setTag:0];
        [menuItem0Button setFrame:CGRectMake(91, 558, 145, 38)];
        [menuItem0Button addTarget:self action:@selector(clickSportsParkButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        UIButton *menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setFrame:CGRectMake(457, 514, 145, 38)];
        [menuItem1Button addTarget:self action:@selector(clickPlanningButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        UIButton *menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:2];
        [menuItem2Button setFrame:CGRectMake(664, 448, 145, 38)];
        [menuItem2Button addTarget:self action:@selector(clickBusinessButton:) forControlEvents:UIControlEventTouchUpInside];
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

- (void)clickSportsParkButton:(id)sender {
    ProjectIntroductionSportsParkViewController *projectIntroductionSportsParkViewController = [[ProjectIntroductionSportsParkViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectIntroductionSportsParkViewController animated:NO];
}

- (void)clickPlanningButton:(id)sender {
    ProjectIntroductionPlanningViewController *projectIntroductionPlanningViewController = [[ProjectIntroductionPlanningViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectIntroductionPlanningViewController animated:NO];
}

- (void)clickBusinessButton:(id)sender {
    ProjectIntroductionBusinessViewController *projectIntroductionBusinessViewController = [[ProjectIntroductionBusinessViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectIntroductionBusinessViewController animated:NO];
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
