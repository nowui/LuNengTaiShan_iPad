//
//  PanoramaViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/22/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "PanoramaViewController.h"
#import "PanoramaView.h"

@interface PanoramaViewController () {
    PanoramaView *panoramaView;
    NSString *imageName;
}

@end

@implementation PanoramaViewController

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        imageName = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    panoramaView = [[PanoramaView alloc] init];
    [panoramaView setImageWithName:[NSString stringWithFormat:@"%@.jpg", imageName]];
    //	[panoramaView setImageWithName:@"spectrum.png"];
    [panoramaView setOrientToDevice:NO];
    [panoramaView setTouchToPan:YES];
    [panoramaView setPinchToZoom:NO];
    [panoramaView setShowTouches:NO];
    [panoramaView setVRMode:NO];
    [self setView:panoramaView];
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [panoramaView draw];
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
