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
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        
        playerView = [[GUIPlayerView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [playerView setDelegate:self];
        [playerView setVideoURL:[[NSBundle mainBundle] URLForResource:@"00" withExtension:@"MP4"]];
        [playerView prepareAndPlayAutomatically:YES];
        [self.view addSubview:playerView];
        
        for(UIView *view in playerView.subviews) {
            if([view isKindOfClass:[UIView class]]) {
                [view setHidden:YES];
            }
        }
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [doneButton setFrame:CGRectMake(1024 - 80, 30 ,80, 30)];
        [doneButton addTarget:self action:@selector(clickDoneButton:) forControlEvents:UIControlEventTouchUpInside];
        [doneButton setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
        [self.view addSubview:doneButton];
    }
    return self;
}

- (void)clickDoneButton:(id)sender {
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
