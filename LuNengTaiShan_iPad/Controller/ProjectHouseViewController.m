//
//  ProjectHouseViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectHouseViewController.h"
#import "ProjectHouseTypeViewController.h"

@interface ProjectHouseViewController () {
    CATransition *transition;
    UIImageView *backgroundImageView;
    int selectIndex;
}

@end

@implementation ProjectHouseViewController

- (id)init {
    self = [super init];
    if (self) {
        selectIndex = -1;
        
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"project_house_bg.png"]];
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
        [menuItem0Button setFrame:CGRectMake(46, 694, 90, 33)];
        [menuItem0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        UIButton *menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setFrame:CGRectMake(148, 694, 90, 33)];
        [menuItem1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        UIButton *menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:2];
        [menuItem2Button setFrame:CGRectMake(251, 694, 90, 33)];
        [menuItem2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        UIButton *menuItem3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem3Button setTag:3];
        [menuItem3Button setFrame:CGRectMake(354, 694, 90, 33)];
        [menuItem3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem3Button];
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
    
    if(selectIndex == tag) {
        selectIndex = -1;
        
        [backgroundImageView setImage:[UIImage imageNamed:@"project_house_bg.png"]];
    } else {
        selectIndex = tag;
        
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_house_%d_bg.png", selectIndex]]];
        
        [self performSelector:@selector(pushView) withObject:nil afterDelay:0.5f];
    }
}

- (void)pushView {
    ProjectHouseTypeViewController *projectHouseTypeViewController = [[ProjectHouseTypeViewController alloc] initWithFatherIndex:selectIndex];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectHouseTypeViewController animated:NO];
    
    selectIndex = -1;
    
    [backgroundImageView setImage:[UIImage imageNamed:@"project_house_bg.png"]];
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
