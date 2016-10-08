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
    UIImageView *titleImageView;
    UIImageView *textImageView;
    UIButton *menuItem0Button;
    UIButton *menuItem1Button;
    UIButton *menuItem2Button;
    UIImageView *noteImageView;
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
        
        noteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [noteImageView setAlpha:0.0];
        [noteImageView setImage:[UIImage imageNamed:@"project_introduction_sports_park_note.png"]];
        [self.view addSubview:noteImageView];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(58, 64, 199, 72)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:@"project_introduction_sports_park_title.png"]];
        [self.view addSubview:titleImageView];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(158, 150, 262, 32)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:@"project_introduction_sports_park_text.png"]];
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
        [menuItem0Button setFrame:CGRectMake(803, 222, 140, 45)];
        [menuItem0Button setImage:[UIImage imageNamed:@"project_introduction_sports_park_menu_0.png"] forState:UIControlStateNormal];
        [menuItem0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:2];
        [menuItem1Button setAlpha:0.0];
        [menuItem1Button setFrame:CGRectMake(674, 381, 140, 45)];
        [menuItem1Button setImage:[UIImage imageNamed:@"project_introduction_sports_park_menu_2.png"] forState:UIControlStateNormal];
        [menuItem1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:1];
        [menuItem2Button setAlpha:0.0];
        [menuItem2Button setFrame:CGRectMake(297, 327, 140, 45)];
        [menuItem2Button setImage:[UIImage imageNamed:@"project_introduction_sports_park_menu_1.png"] forState:UIControlStateNormal];
        [menuItem2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        [self showNote];
        
        [self performSelector:@selector(showTitle) withObject:nil afterDelay:0.5f];
        
        [self performSelector:@selector(showText) withObject:nil afterDelay:1.0f];
        
        [self performSelector:@selector(showMenuItem2) withObject:nil afterDelay:1.5f];
        
        [self performSelector:@selector(showMenuItem1) withObject:nil afterDelay:2.0f];
        
        [self performSelector:@selector(showMenuItem0) withObject:nil afterDelay:2.5f];
    }
    return self;
}

- (void)showNote {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [noteImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(hideNote)];
    [UIView commitAnimations];
}

- (void)hideNote {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [noteImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showNote)];
    [UIView commitAnimations];
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
    frame.origin.x = 58;
    [textImageView setFrame:frame];
    [textImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem0 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem0Button.frame;
    frame.origin.x = 703;
    [menuItem0Button setFrame:frame];
    [menuItem0Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem1Button.frame;
    frame.origin.x = 574;
    [menuItem1Button setFrame:frame];
    [menuItem1Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem2Button.frame;
    frame.origin.x = 197;
    [menuItem2Button setFrame:frame];
    [menuItem2Button setAlpha:1.0];
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
