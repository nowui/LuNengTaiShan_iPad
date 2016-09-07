//
//  RegionalViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "RegionalViewController.h"
#import "RegionalTrafficViewController.h"
#import "RegionalMatchingViewController.h"

@interface RegionalViewController () {
    CATransition *transition;
}

@end

@implementation RegionalViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"regional_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setFrame:CGRectMake(0, 0, 85, 85)];
        [menuButton addTarget:self action:@selector(clickMenuButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:menuButton];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(946, 21, 50, 50)];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
        
        UIButton *trafficButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [trafficButton setFrame:CGRectMake(254, 322, 167, 153)];
        [trafficButton addTarget:self action:@selector(clickTrafficButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:trafficButton];
        
        UIButton *matchingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [matchingButton setFrame:CGRectMake(572, 322, 198, 153)];
        [matchingButton addTarget:self action:@selector(clickMatchingButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:matchingButton];
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

- (void)clickTrafficButton:(id)sender {
    RegionalTrafficViewController *regionalTrafficViewController = [[RegionalTrafficViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:regionalTrafficViewController animated:NO];
}

- (void)clickMatchingButton:(id)sender {
    RegionalMatchingViewController *regionalMatchingViewController = [[RegionalMatchingViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:regionalMatchingViewController animated:NO];
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
