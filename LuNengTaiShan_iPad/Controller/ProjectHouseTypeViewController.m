//
//  ProjectHouseTypeViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectHouseTypeViewController.h"
#import "RoamViewController.h"
#import "CalculatorView.h"

@interface ProjectHouseTypeViewController () {
    CATransition *transition;
    UIImageView *backgroundImageView;
    UIImageView *typeImageView;
    int selectIndex;
    int fatherIndex;
    int countIndex;
    CGPoint point;
    NSString *name;
    UIButton *roamButton;
    UIImageView *titleImageView;
    UIImageView *textImageView;
    UIButton *menuItem0Button;
    UIButton *menuItem1Button;
    UIButton *menuItem2Button;
    UIImageView *handImageView;
    BOOL isLoad;
}

@end

@implementation ProjectHouseTypeViewController

- (id)initWithFatherIndex:(int)index {
    self = [super init];
    if (self) {
        selectIndex = 0;
        fatherIndex = index;
        countIndex = 0;
        name = @"";
        
        if(index == 0) {
            name = @"A";
        } else if(index == 1) {
            name = @"B_000";
        } else if(index == 2) {
            name = @"C";
        } else if(index == 3) {
            name = @"D";
        }
        
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        typeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [typeImageView setAlpha:0.0];
        [typeImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%.5d.png", name, countIndex]]];
        [self.view addSubview:typeImageView];
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        //[backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_hourse_type_%d_%d_bg.png", fatherIndex, selectIndex]]];
        [self.view addSubview:backgroundImageView];
        
        titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 1024, 768)];
        [titleImageView setAlpha:0.0];
        [titleImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_hourse_type_%d_title.png", fatherIndex]]];
        [self.view addSubview:titleImageView];
        
        textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 1024, 768)];
        [textImageView setAlpha:0.0];
        [textImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_hourse_type_%d_text.png", fatherIndex]]];
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
        [menuItem0Button setSelected:YES];
        [menuItem0Button setFrame:CGRectMake(168, 688, 126, 38)];
        [menuItem0Button setImage:[UIImage imageNamed:@"project_hourse_type_menu_0.png"] forState:UIControlStateNormal];
        [menuItem0Button setImage:[UIImage imageNamed:@"project_hourse_type_menu_0_active.png"] forState:UIControlStateSelected];
        [menuItem0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setAlpha:0.0];
        [menuItem1Button setFrame:CGRectMake(316, 688, 126, 38)];
        [menuItem1Button setImage:[UIImage imageNamed:@"project_hourse_type_menu_1.png"] forState:UIControlStateNormal];
        [menuItem1Button setImage:[UIImage imageNamed:@"project_hourse_type_menu_1_active.png"] forState:UIControlStateSelected];
        [menuItem1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:2];
        [menuItem2Button setAlpha:0.0];
        [menuItem2Button setFrame:CGRectMake(465, 688, 126, 38)];
        [menuItem2Button setImage:[UIImage imageNamed:@"project_hourse_type_menu_2.png"] forState:UIControlStateNormal];
        [menuItem2Button setImage:[UIImage imageNamed:@"project_hourse_type_menu_2_active.png"] forState:UIControlStateSelected];
        [menuItem2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        roamButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [roamButton setAlpha:0.0];
        [roamButton setFrame:CGRectMake(918, 699, 90, 27)];
        [roamButton setImage:[UIImage imageNamed:@"project_house_menu_720.png"] forState:UIControlStateNormal];
        [roamButton addTarget:self action:@selector(cickRoamButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:roamButton];
        
        handImageView = [[UIImageView alloc] initWithFrame:CGRectMake(445, 360, 55, 61)];
        [handImageView setAlpha:0.0];
        [handImageView setImage:[UIImage imageNamed:@"button_hand.png"]];
        [self.view addSubview:handImageView];
        
        [self performSelector:@selector(showTitle) withObject:nil afterDelay:0.5f];
        
        [self performSelector:@selector(showText) withObject:nil afterDelay:1.0f];
        
        [self performSelector:@selector(showMenuItem0) withObject:nil afterDelay:1.5f];
        
        [self performSelector:@selector(showMenuItem1) withObject:nil afterDelay:2.0f];
        
        [self performSelector:@selector(showMenuItem2) withObject:nil afterDelay:2.5f];
        
        if(index == 1) {
            [self performSelector:@selector(showRoam) withObject:nil afterDelay:3.0f];
        }
    }
    return self;
}

- (void)show {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [handImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showRight)];
    [UIView commitAnimations];
}

- (void)showRight {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = handImageView.frame;
    frame.origin.x = 545;
    [handImageView setFrame:frame];
    [UIView setAnimationDidStopSelector:@selector(showLeft)];
    [UIView commitAnimations];
}

- (void)showLeft {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = handImageView.frame;
    frame.origin.x = 445;
    [handImageView setFrame:frame];
    [UIView setAnimationDidStopSelector:@selector(hide)];
    [UIView commitAnimations];
}

- (void)hide {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    [handImageView setAlpha:0.0];
    [UIView commitAnimations];
}

- (void)showTitle {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = titleImageView.frame;
    frame.origin.x = 0;
    [titleImageView setFrame:frame];
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
    frame.origin.x = 68;
    [menuItem0Button setFrame:frame];
    [menuItem0Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem1 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem1Button.frame;
    frame.origin.x = 216;
    [menuItem1Button setFrame:frame];
    [menuItem1Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showMenuItem2 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = menuItem2Button.frame;
    frame.origin.x = 365;
    [menuItem2Button setFrame:frame];
    [menuItem2Button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showRoam {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = roamButton.frame;
    frame.origin.x = 818;
    [roamButton setFrame:frame];
    [roamButton setAlpha:1.0];
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
        CalculatorView *calculatorView = [[CalculatorView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [self.view addSubview:calculatorView];
    } else {
        selectIndex = tag;
        
        [menuItem0Button setSelected:NO];
        [menuItem1Button setSelected:NO];
        [menuItem2Button setSelected:NO];
        
        if(tag == 0) {
            [menuItem0Button setSelected:YES];
            
            [handImageView setAlpha:0.0];
        } else if(tag == 1) {
            [menuItem1Button setSelected:YES];
            
            if(! isLoad) {
                isLoad = YES;
                
                [self performSelector:@selector(show) withObject:nil afterDelay:1.0f];
            }
        }
        
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    if(tag == 0) {
        [roamButton setAlpha:1.0];
        
        [typeImageView setAlpha:0.0];
        
        [titleImageView setAlpha:1.0];
        
        [textImageView setAlpha:1.0];
    } else if(tag == 1) {
        [roamButton setAlpha:0.0];
        
        [typeImageView setAlpha:1.0];
        
        [titleImageView setAlpha:0.0];
        
        [textImageView setAlpha:0.0];
    }
    [UIView commitAnimations];
    
    
}

- (void)cickRoamButton:(id)sender {
    if([name isEqual:@"B_000"]) {
        RoamViewController *roamViewController = [[RoamViewController alloc] initWithName:@"project_hourse_type_1_720"];
        [[self navigationController] pushViewController:roamViewController animated:NO];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    point = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    if(currentPoint.x < point.x) {
        countIndex += point.x - currentPoint.x;
        
        if(countIndex > 300) {
            countIndex = 0;
        }
        
        [typeImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%.5d.png", name, countIndex]]];
    } else if(currentPoint.x > point.x) {
        countIndex -= currentPoint.x - point.x;
        
        if(countIndex < 0) {
            countIndex = 300;
        }
        
        [typeImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%.5d.png", name, countIndex]]];
    }
    
    point = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

}

@end
