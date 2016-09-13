//
//  RegionalTrafficViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/8/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "RegionalTrafficViewController.h"
#import "RegionalTrafficView.h"

@interface RegionalTrafficViewController () {
    CATransition *transition;
    int selectIndex;
    UIImageView *backgroundImageView;
    UIView *menu0View;
    UIView *menu1View;
    UIView *menu2View;
    UIView *menu3View;
}

@end

@implementation RegionalTrafficViewController

- (id)init {
    self = [super init];
    if (self) {
        selectIndex = -1;
        
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"regional_traffic_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        [self addMenu0View];
        
        [self addMenu1View];
        
        [self addMenu2View];
        
        [self addMenu3View];
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(923, 15, 40, 40)];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(962, 15, 40, 40)];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
        
        UIButton *menu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu0Button setTag:0];
        [menu0Button setFrame:CGRectMake(507, 695, 106, 40)];
        [menu0Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu0Button];
        
        UIButton *menu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu1Button setTag:1];
        [menu1Button setFrame:CGRectMake(616, 695, 106, 40)];
        [menu1Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu1Button];
        
        UIButton *menu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu2Button setTag:2];
        [menu2Button setFrame:CGRectMake(726, 695, 106, 40)];
        [menu2Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu2Button];
        
        UIButton *menu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu3Button setTag:3];
        [menu3Button setFrame:CGRectMake(834, 695, 106, 40)];
        [menu3Button addTarget:self action:@selector(clickMenuItemButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menu3Button];
    }
    return self;
}

- (void)addMenu0View {
    menu0View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu0View setAlpha:0.0];
    [self.view addSubview:menu0View];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(558, 355, 101, 41)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(293, 334, 96, 50)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(827, 377, 124, 44)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(252, 383, 120, 46)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu3Button];
    
    UIButton *subMenu4Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu4Button setTag:4];
    [subMenu4Button setFrame:CGRectMake(388, 328, 94, 46)];
    [subMenu4Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu4Button];
    
    UIButton *subMenu5Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu5Button setTag:5];
    [subMenu5Button setFrame:CGRectMake(762, 108, 114, 46)];
    [subMenu5Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu0View addSubview:subMenu5Button];
}

- (void)addMenu1View {
    menu1View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu1View setAlpha:0.0];
    [self.view addSubview:menu1View];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(177, 335, 79, 31)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(577, 365, 84, 52)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(263, 332, 81, 42)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu2Button];
    
    UIButton *subMenu3Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu3Button setTag:3];
    [subMenu3Button setFrame:CGRectMake(701, 288, 99, 43)];
    [subMenu3Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu3Button];
    
    UIButton *subMenu4Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu4Button setTag:4];
    [subMenu4Button setFrame:CGRectMake(250, 294, 80, 37)];
    [subMenu4Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu4Button];
    
    UIButton *subMenu5Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu5Button setTag:5];
    [subMenu5Button setFrame:CGRectMake(147, 301, 81, 40)];
    [subMenu5Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu5Button];
    
    UIButton *subMenu6Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu6Button setTag:6];
    [subMenu6Button setFrame:CGRectMake(117, 362, 81, 34)];
    [subMenu6Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu6Button];
    
    UIButton *subMenu7Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu7Button setTag:7];
    [subMenu7Button setFrame:CGRectMake(484, 463, 95, 41)];
    [subMenu7Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu7Button];
    
    UIButton *subMenu8Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu8Button setTag:8];
    [subMenu8Button setFrame:CGRectMake(78, 369, 64, 41)];
    [subMenu8Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu1View addSubview:subMenu8Button];
}

- (void)addMenu2View {
    menu2View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu2View setAlpha:0.0];
    [self.view addSubview:menu2View];
    
    UIButton *subMenu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu0Button setTag:0];
    [subMenu0Button setFrame:CGRectMake(191, 387, 127, 44)];
    [subMenu0Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu0Button];
    
    UIButton *subMenu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu1Button setTag:1];
    [subMenu1Button setFrame:CGRectMake(317, 105, 93, 45)];
    [subMenu1Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu1Button];
    
    UIButton *subMenu2Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [subMenu2Button setTag:2];
    [subMenu2Button setFrame:CGRectMake(817, 321, 116, 45)];
    [subMenu2Button addTarget:self action:@selector(cickSubMemuItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [menu2View addSubview:subMenu2Button];
}

- (void)addMenu3View {
    menu3View = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [menu3View setAlpha:0.0];
    [self.view addSubview:menu3View];
}

- (void)clickMenuItemButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    [menu0View setAlpha:0.0];
    [menu1View setAlpha:0.0];
    [menu2View setAlpha:0.0];
    [menu3View setAlpha:0.0];
    
    if(selectIndex == tag) {
        selectIndex = -1;
        
        [backgroundImageView setImage:[UIImage imageNamed:@"regional_traffic_bg.png"]];
    } else {
        selectIndex = tag;
        
        if(selectIndex == 0) {
            [menu0View setAlpha:1.0];
        } else if(selectIndex == 1) {
            [menu1View setAlpha:1.0];
        } else if(selectIndex == 2) {
            [menu2View setAlpha:1.0];
        } else if(selectIndex == 3) {
            [menu3View setAlpha:1.0];
        }
        
        [backgroundImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"regional_traffic_%d_bg.png", selectIndex]]];
    }
}

- (void)cickSubMemuItemButton:(id)sender {
    if(selectIndex == -1) {
        return;
    }
    
    int tag = (int) ((UIButton *)sender).tag;
    
    RegionalTrafficView *regionalTrafficView = [[RegionalTrafficView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768) withFatherIndex:selectIndex withIndex:tag];
    [self.view addSubview:regionalTrafficView];
}

- (void)clickMenuButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:NO];
}

- (void)clickCloseButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
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
