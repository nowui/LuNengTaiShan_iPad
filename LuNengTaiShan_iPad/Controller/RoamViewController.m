//
//  RoamViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/21/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "RoamViewController.h"
#import "PanoramaViewController.h"

@interface RoamViewController () {
    CATransition *transition;
    NSString *imageName;
}

@end

@implementation RoamViewController

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        imageName = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PanoramaViewController *panoramaViewController = [[PanoramaViewController alloc] initWithName:imageName];
    [self.view addSubview:panoramaViewController.view];
    [self addChildViewController:panoramaViewController];
    [panoramaViewController didMoveToParentViewController:self];
    
    panoramaViewController.view.frame = self.view.frame;
    
    UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closButton setFrame:CGRectMake(962, 15, 50, 50)];
    [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
    [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closButton];
}

- (void)clickCloseButton:(id)sender {
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
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
