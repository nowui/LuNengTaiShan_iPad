//
//  MainViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/6/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "MainViewController.h"
#import "BrandViewController.h"
#import "RegionalViewController.h"
#import "ProjectViewController.h"

@interface MainViewController () {
    CATransition *transition;
}

@end

@implementation MainViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"main_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        UIButton *brandButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [brandButton setFrame:CGRectMake(435, 524, 88, 66)];
        [brandButton addTarget:self action:@selector(clickBrandButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:brandButton];
        
        UIButton *regionalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [regionalButton setFrame:CGRectMake(585, 524, 106, 66)];
        [regionalButton addTarget:self action:@selector(clickRegionalButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:regionalButton];
        
        UIButton *projectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [projectButton setFrame:CGRectMake(757, 524, 80, 66)];
        [projectButton addTarget:self action:@selector(clickProjectButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:projectButton];
        
        UIButton *videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [videoButton setFrame:CGRectMake(930, 524, 74, 66)];
        [videoButton addTarget:self action:@selector(clickVideoButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:videoButton];
    }
    return self;
}

- (void)clickBrandButton:(id)sender {
    BrandViewController *brandViewController = [[BrandViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:brandViewController animated:NO];
}

- (void)clickRegionalButton:(id)sender {
    RegionalViewController *regionalViewController = [[RegionalViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:regionalViewController animated:NO];
}

- (void)clickProjectButton:(id)sender {
    ProjectViewController *projectViewController = [[ProjectViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:projectViewController animated:NO];
}

- (void)clickVideoButton:(id)sender {
    NSLog(@"123");
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
