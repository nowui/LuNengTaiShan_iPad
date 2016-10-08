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
    UIImageView *noteImageView;
    UIImageView *maskImageView;
    UIButton *menuItem0Button;
    UIButton *menuItem1Button;
    UIButton *menuItem2Button;
    UIView *maskView;
    UIImageView *maskTitleImageView;
    UIImageView *maskTextImageView;
}

@end

@implementation ProjectIntroductionViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"project_introduction_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        noteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [noteImageView setAlpha:0.0];
        [noteImageView setImage:[UIImage imageNamed:@"project_introduction_note.png"]];
        [self.view addSubview:noteImageView];
        
        menuItem0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem0Button setTag:0];
        [menuItem0Button setAlpha:0.0];
        [menuItem0Button setFrame:CGRectMake(189, 558, 142, 46)];
        [menuItem0Button setImage:[UIImage imageNamed:@"project_introduction_menu_0.png"] forState:UIControlStateNormal];
        [menuItem0Button addTarget:self action:@selector(clickSportsParkButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setAlpha:0.0];
        [menuItem1Button setFrame:CGRectMake(555, 514, 142, 46)];
        [menuItem1Button setImage:[UIImage imageNamed:@"project_introduction_menu_1.png"] forState:UIControlStateNormal];
        [menuItem1Button addTarget:self action:@selector(clickPlanningButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:2];
        [menuItem2Button setAlpha:0.0];
        [menuItem2Button setFrame:CGRectMake(765, 448, 99, 46)];
        [menuItem2Button setImage:[UIImage imageNamed:@"project_introduction_menu_2.png"] forState:UIControlStateNormal];
        [menuItem2Button addTarget:self action:@selector(clickBusinessButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [self.view addSubview:maskView];
        
        maskImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [maskImageView setUserInteractionEnabled:YES];
        [maskImageView setImage:[UIImage imageNamed:@"project_introduction_mask_bg.png"]];
        [maskView addSubview:maskImageView];
        
        maskTitleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(195, 260, 592, 73)];
        [maskTitleImageView setAlpha:0.0];
        [maskTitleImageView setImage:[UIImage imageNamed:@"project_introduction_mask_title.png"]];
        [maskView addSubview:maskTitleImageView];
        
        maskTextImageView = [[UIImageView alloc] initWithFrame:CGRectMake(319, 370, 536, 64)];
        [maskTextImageView setAlpha:0.0];
        [maskTextImageView setImage:[UIImage imageNamed:@"project_introduction_mask_text.png"]];
        [maskView addSubview:maskTextImageView];
        
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
        
        [self performSelector:@selector(showMaskTitle) withObject:nil afterDelay:0.5f];
        
        [self performSelector:@selector(showMaskText) withObject:nil afterDelay:1.0f];
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

- (void)showMaskTitle {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [maskTitleImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMaskText {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = maskTextImageView.frame;
    frame.origin.x = 219;
    [maskTextImageView setFrame:frame];
    [maskTextImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showGesture)];
    [UIView commitAnimations];
}

- (void)showGesture {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap:)];
    [maskView addGestureRecognizer:tapGestureRecognizer];
}

- (void)showMenu0 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem0Button.frame;
    frame.origin.x = 89;
    [menuItem0Button setFrame:frame];
    [menuItem0Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenu1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem1Button.frame;
    frame.origin.x = 455;
    [menuItem1Button setFrame:frame];
    [menuItem1Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenu2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem2Button.frame;
    frame.origin.x = 665;
    [menuItem2Button setFrame:frame];
    [menuItem2Button setAlpha:1.0];
    [UIView commitAnimations];
}

-(void)clickTap:(UITapGestureRecognizer*)recognizer {
    [maskView removeFromSuperview];
    
    [self showNote];
    
    [self performSelector:@selector(showMenu0) withObject:nil afterDelay:0.0f];
    
    [self performSelector:@selector(showMenu1) withObject:nil afterDelay:0.5f];
    
    [self performSelector:@selector(showMenu2) withObject:nil afterDelay:1.0f];
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
