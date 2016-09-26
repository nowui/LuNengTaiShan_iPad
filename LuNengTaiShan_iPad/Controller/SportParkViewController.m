//
//  SportParkViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/22/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "SportParkViewController.h"
#import "PanoramaViewController.h"

@interface SportParkViewController () {
    CATransition *transition;
    UIButton *textButton;
    BOOL isHide;
}

@end

@implementation SportParkViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PanoramaViewController *panoramaViewController = [[PanoramaViewController alloc] initWithName:@"sport_park_720"];
    [self.view addSubview:panoramaViewController.view];
    [self addChildViewController:panoramaViewController];
    [panoramaViewController didMoveToParentViewController:self];
    
    panoramaViewController.view.frame = self.view.frame;
    
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
    
    textButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [textButton setFrame:CGRectMake(0, 195, 206, 345)];
    [textButton setImage:[UIImage imageNamed:@"sport_park_text.png"] forState:UIControlStateNormal];
    [textButton addTarget:self action:@selector(clickTextButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textButton];
}

- (void)clickMenuButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:NO];
}

- (void)clickCloseButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)clickTextButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationDelegate:self];
    CGRect frame = textButton.frame;
    if(isHide) {
        frame.origin.x += 190;
    } else {
        frame.origin.x -= 190;
    }
    [textButton setFrame:frame];
    [UIView commitAnimations];
    
    isHide = ! isHide;
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
