//
//  VideoViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/7/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "VideoViewController.h"
#import "GUIPlayerView.h"

@interface VideoViewController () <GUIPlayerViewDelegate> {
    GUIPlayerView *playerView;
    CATransition *transition;
}

@end

@implementation VideoViewController

- (void) dealloc {
    [playerView clean];
}

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"video_bg.png"]];
        [self.view addSubview:backgroundImageView];
        
        playerView = [[GUIPlayerView alloc] initWithFrame:CGRectMake(256, 192, 512, 384)];
        [playerView setDelegate:self];
        [playerView setVideoURL:[[NSBundle mainBundle] URLForResource:@"video" withExtension:@"mov"]];
        [playerView prepareAndPlayAutomatically:YES];
        [playerView setFullscreen];
        [self.view addSubview:playerView];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(946, 21, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:closButton];
    }
    return self;
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
