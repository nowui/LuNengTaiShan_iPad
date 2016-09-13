//
//  BrandIndustryViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "BrandIndustryViewController.h"
#import "BrandIndustryView.h"

@interface BrandIndustryViewController () {
    UIImageView *backgroundImageView;
    CATransition *transition;
    int selectIndex;
    UIView *menu0View;
    UIView *menu1View;
    UIView *menu2View;
    UIView *menu3View;
}

@end

@implementation BrandIndustryViewController

- (id)init {
    self = [super init];
    if (self) {
        selectIndex = 0;
        
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_industry_%d_bg.png", selectIndex]]];
        [self.view addSubview:backgroundImageView];
        
        [self addMenu0View];
        
        [self addMenu1View];
        
        [self addMenu2View];
        
        [self addMenu3View];
        
        [menu0View setAlpha:1.0];
        
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
        [menuItem0Button setFrame:CGRectMake(67, 601, 106, 63)];
        [menuItem0Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem0Button];
        
        UIButton *menuItem1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem1Button setTag:1];
        [menuItem1Button setFrame:CGRectMake(172, 601, 106, 63)];
        [menuItem1Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem1Button];
        
        UIButton *menuItem2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem2Button setTag:2];
        [menuItem2Button setFrame:CGRectMake(67, 664, 106, 63)];
        [menuItem2Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem2Button];
        
        UIButton *menuItem3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem3Button setTag:3];
        [menuItem3Button setFrame:CGRectMake(172, 664, 106, 63)];
        [menuItem3Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuItem3Button];
    }
    return self;
}

- (void)addMenu0View {
    menu0View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu0View setAlpha:0.0];
    [self.view addSubview:menu0View];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(615, 433, 35, 61)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(675, 251, 35, 61)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(535, 446, 35, 61)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(821, 223, 35, 61)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu3Button];
    
    UIButton *subMenu4Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu4Button setTag:4];
    [subMenu4Button setFrame:CGRectMake(621, 641, 35, 61)];
    [subMenu4Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu4Button];
    
    UIButton *subMenu5Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu5Button setTag:5];
    [subMenu5Button setFrame:CGRectMake(733, 325, 35, 61)];
    [subMenu5Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu5Button];
    
    UIButton *subMenu6Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu6Button setTag:6];
    [subMenu6Button setFrame:CGRectMake(764, 375, 35, 61)];
    [subMenu6Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu6Button];
    
    UIButton *subMenu7Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu7Button setTag:7];
    [subMenu7Button setFrame:CGRectMake(706, 267, 35, 61)];
    [subMenu7Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu7Button];
    
    UIButton *subMenu8Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu8Button setTag:8];
    [subMenu8Button setFrame:CGRectMake(615, 433, 35, 61)];
    [subMenu8Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu8Button];
}

- (void)addMenu1View {
    menu1View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu1View setAlpha:0.0];
    [self.view addSubview:menu1View];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(822, 225, 35, 61)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(683, 551, 35, 61)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(622, 643, 35, 61)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(646, 492, 35, 61)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu3Button];
    
    UIButton *subMenu4Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu4Button setTag:4];
    [subMenu4Button setFrame:CGRectMake(737, 327, 35, 61)];
    [subMenu4Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu4Button];
    
    UIButton *subMenu5Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu5Button setTag:5];
    [subMenu5Button setFrame:CGRectMake(533, 445, 35, 61)];
    [subMenu5Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu5Button];
    
    UIButton *subMenu6Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu6Button setTag:6];
    [subMenu6Button setFrame:CGRectMake(614, 433, 35, 61)];
    [subMenu6Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu6Button];
    
    UIButton *subMenu7Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu7Button setTag:7];
    [subMenu7Button setFrame:CGRectMake(706, 267, 35, 61)];
    [subMenu7Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu7Button];
}

- (void)addMenu2View {
    menu2View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu2View setAlpha:0.0];
    [self.view addSubview:menu2View];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(619, 642, 35, 61)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(668, 311, 35, 61)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(811, 167, 35, 61)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(530, 446, 35, 61)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu3Button];
}

- (void)addMenu3View {
    menu3View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu3View setAlpha:0.0];
    [self.view addSubview:menu3View];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(530, 360, 35, 61)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu3View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(668, 311, 35, 61)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu3View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(558, 244, 35, 61)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu3View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(247, 224, 35, 61)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu3View addSubview:subMenu3Button];
}

- (void)clickMenuItemButton:(id)sender {
    selectIndex = (int) ((UIButton *)sender).tag;
    
    [menu0View setAlpha:0.0];
    [menu1View setAlpha:0.0];
    [menu2View setAlpha:0.0];
    [menu3View setAlpha:0.0];
    
    if(selectIndex == 0) {
        [menu0View setAlpha:1.0];
    } else if(selectIndex == 1) {
        [menu1View setAlpha:1.0];
    } else if(selectIndex == 2) {
        [menu2View setAlpha:1.0];
    } else if(selectIndex == 3) {
        [menu3View setAlpha:1.0];
    }
    
    [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"brand_industry_%d_bg.png", selectIndex]]];
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
    if(selectIndex == -1) {
        return;
    }
    
    int tag = (int) ((UIButton *)sender).tag;
    
    BrandIndustryView *brandIndustryView = [[BrandIndustryView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) withFatherIndex:selectIndex withIndex:tag];
    [self.view addSubview:brandIndustryView];
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
