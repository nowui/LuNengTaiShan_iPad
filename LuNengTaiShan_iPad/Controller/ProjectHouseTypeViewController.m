//
//  ProjectHouseTypeViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "ProjectHouseTypeViewController.h"
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
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        typeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [typeImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%.5d.png", name, countIndex]]];
        [self.view addSubview:typeImageView];
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_hourse_type_%d_%d_bg.png", fatherIndex, selectIndex]]];
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
        [menuItem0Button setFrame:CGRectMake(68, 688, 126, 38)];
        [menuItem0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        UIButton *menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setFrame:CGRectMake(216, 688, 126, 38)];
        [menuItem1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        UIButton *menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:2];
        [menuItem2Button setFrame:CGRectMake(365, 688, 126, 386)];
        [menuItem2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(360, 688, 130, 390)];
        [view setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:view];
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
        CalculatorView *calculatorView = [[CalculatorView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [self.view addSubview:calculatorView];
    } else {
        selectIndex = tag;
        
        if(tag == 0) {
            [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_hourse_type_%d_%d_bg.png", fatherIndex, selectIndex]]];
        } else {
            [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"project_hourse_type_%d_bg.png", selectIndex]]];
        }
        
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
        countIndex++;
        
        if(countIndex > 298) {
            countIndex = 0;
        }
        
        [typeImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%.5d.png", name, countIndex]]];
    } else if(currentPoint.x > point.x) {
        countIndex--;
        
        if(countIndex < 0) {
            countIndex = 298;
        }
        
        [typeImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%.5d.png", name, countIndex]]];
    }
    
    point = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

}

@end
