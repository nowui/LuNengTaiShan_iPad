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
    UIImageView *maskImageView;
    UIImageView *titleImageView;
    UIImageView *textImageView;
    UIButton *menuItem0Button;
    UIButton *menuItem1Button;
    UIButton *menuItem2Button;
    UIButton *menuItem3Button;
    int selectIndex;
}

@end

@implementation ProjectHouseViewController

- (id)init {
    self = [super init];
    if (self) {
        selectIndex = -1;
        
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"project_house_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        maskImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [self.view addSubview:maskImageView];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(69, 583, 245, 69)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:@"project_house_title.png"]];
        [self.view addSubview:titleImageView];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 1024, 768)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:@"project_house_text.png"]];
        [self.view addSubview:textImageView];
        
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
        
        menuItem0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem0Button setTag:0];
        [menuItem0Button setAlpha:0.0];
        [menuItem0Button setFrame:CGRectMake(96, 694, 90, 31)];
        [menuItem0Button setImage:[UIImage imageNamed:@"project_house_menu_0.png"] forState:UIControlStateNormal];
        [menuItem0Button setImage:[UIImage imageNamed:@"project_house_menu_0_active.png"] forState:UIControlStateSelected];
        [menuItem0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setAlpha:0.0];
        [menuItem1Button setFrame:CGRectMake(198, 694, 90, 31)];
        [menuItem1Button setImage:[UIImage imageNamed:@"project_house_menu_1.png"] forState:UIControlStateNormal];
        [menuItem1Button setImage:[UIImage imageNamed:@"project_house_menu_1_active.png"] forState:UIControlStateSelected];
        [menuItem1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:2];
        [menuItem2Button setAlpha:0.0];
        [menuItem2Button setFrame:CGRectMake(301, 694, 90, 31)];
        [menuItem2Button setImage:[UIImage imageNamed:@"project_house_menu_2.png"] forState:UIControlStateNormal];
        [menuItem2Button setImage:[UIImage imageNamed:@"project_house_menu_2_active.png"] forState:UIControlStateSelected];
        [menuItem2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        menuItem3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem3Button setTag:3];
        [menuItem3Button setAlpha:0.0];
        [menuItem3Button setFrame:CGRectMake(404, 694, 90, 31)];
        [menuItem3Button setImage:[UIImage imageNamed:@"project_house_menu_3.png"] forState:UIControlStateNormal];
        [menuItem3Button setImage:[UIImage imageNamed:@"project_house_menu_3_active.png"] forState:UIControlStateSelected];
        [menuItem3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem3Button];
        
        [self performSelector:@selector(showTitle) withObject:nil afterDelay:0.5f];
        
        [self performSelector:@selector(showText) withObject:nil afterDelay:1.0f];
        
        [self performSelector:@selector(showMenuItem0) withObject:nil afterDelay:1.5f];
        
        [self performSelector:@selector(showMenuItem1) withObject:nil afterDelay:2.0f];
        
        [self performSelector:@selector(showMenuItem2) withObject:nil afterDelay:2.5f];
        
        [self performSelector:@selector(showMenuItem3) withObject:nil afterDelay:3.0f];
    }
    return self;
}

- (void)showTitle {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [titleImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showText {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = textImageView.frame;
    frame.origin.x = 0;
    [textImageView setFrame:frame];
    [textImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem0 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem0Button.frame;
    frame.origin.x = 46;
    [menuItem0Button setFrame:frame];
    [menuItem0Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem1Button.frame;
    frame.origin.x = 148;
    [menuItem1Button setFrame:frame];
    [menuItem1Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem2Button.frame;
    frame.origin.x = 251;
    [menuItem2Button setFrame:frame];
    [menuItem2Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem3 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem3Button.frame;
    frame.origin.x = 354;
    [menuItem3Button setFrame:frame];
    [menuItem3Button setAlpha:1.0];
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

- (void)cickSubMemuItemButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    [menuItem0Button setSelected:NO];
    [menuItem1Button setSelected:NO];
    [menuItem2Button setSelected:NO];
    [menuItem3Button setSelected:NO];
    
    if(selectIndex == tag) {
        selectIndex = -1;
        
        [maskImageView setAlpha:0.0];
    } else {
        selectIndex = tag;
        
        if(selectIndex == 0) {
            [menuItem0Button setSelected:YES];
        } else if(selectIndex == 1) {
            [menuItem1Button setSelected:YES];
        } else if(selectIndex == 2) {
            [menuItem2Button setSelected:YES];
        } else if(selectIndex == 3) {
            [menuItem3Button setSelected:YES];
        }
        
        [maskImageView setAlpha:1.0];
        
        [maskImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_house_%d_bg.png", selectIndex]]];
        
        [self performSelector:@selector(pushView) withObject:nil afterDelay:0.5f];
    }
}

- (void)pushView {
    ProjectHouseTypeViewController *projectHouseTypeViewController = [[ProjectHouseTypeViewController alloc] initWithFatherIndex:selectIndex];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectHouseTypeViewController animated:NO];
    
    selectIndex = -1;
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
