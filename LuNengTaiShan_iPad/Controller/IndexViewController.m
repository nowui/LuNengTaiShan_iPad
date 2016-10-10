//
//  IndexViewController.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/6/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "IndexViewController.h"
#import "MainViewController.h"
//#import "CalculatorView.h"

@interface IndexViewController () {
    UIImageView *logoImageView;
    UIImageView *textImageView;
    UIImageView *addressImageView;
    UIButton *button;
    CATransition *transition;
    UIImageView *sprite0ImageView;
    UIImageView *sprite1ImageView;
    UIImageView *sprite2ImageView;
    UIImageView *sprite3ImageView;
    UIImageView *sprite4ImageView;
    UIImageView *sprite5ImageView;
    UIImageView *sprite6ImageView;
    UIImageView *sprite7ImageView;
    UIImageView *line0ImageView;
    UIImageView *line1ImageView;
    UIImageView *line2ImageView;
    UIImageView *line3ImageView;
    UIImageView *line4ImageView;
    UIImageView *line5ImageView;
    int logoIndex;
    NSTimer *timer;
}

@end

@implementation IndexViewController

- (id)init {
    self = [super init];
    if (self) {
        transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = @"rippleEffect";
        
        /*UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"index_bg.png"]];
        [self.view addSubview:backgroundImageView];*/
        
        //[self performSelector:@selector(showLogo) withObject:nil afterDelay:1.0f];
        
        /*textImageView = [[UIImageView alloc] initWithFrame:CGRectMake(508, 335, 207, 47)];
         [textImageView setAlpha:0.0];
         [textImageView setImage:[UIImage imageNamed:@"index_text.png"]];
         [self.view addSubview:textImageView];
         
         [self performSelector:@selector(showText) withObject:nil afterDelay:1.5f];*/
        
        
        logoIndex = 0;
        
        
       // NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i = 0; i < 151; i++) {
            //[array addObject:[UIImage imageNamed:[NSString stringWithFormat:@"鲁能_00%.3d.png", i]]];
        }
        
        logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        //[logoImageView setImage:[UIImage imageNamed:@"鲁能_00150.png"]];
        //[logoImageView setAnimationImages:array];
        //[logoImageView setAnimationDuration:6];
        //[logoImageView setAnimationRepeatCount:1];
        //[logoImageView startAnimating];
        [self.view addSubview:logoImageView];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.07 target:self selector:@selector(updateLogo) userInfo:nil repeats:YES];
        [timer fire];
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setAlpha:0.0];
        [button setFrame:CGRectMake(552, 455, 120, 28)];
        [button setImage:[UIImage imageNamed:@"index_button.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"index_button_active.png"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        [self performSelector:@selector(showButton) withObject:nil afterDelay:10.0];
        
        addressImageView = [[UIImageView alloc] initWithFrame:CGRectMake(396, 722, 437, 24)];
        [addressImageView setAlpha:0.0];
        [addressImageView setImage:[UIImage imageNamed:@"index_address.png"]];
        [self.view addSubview:addressImageView];
        
        [self performSelector:@selector(showAddress) withObject:nil afterDelay:10.5f];
        
        line0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 582, 1024, 148)];
        [line0ImageView setAlpha:0.0];
        [line0ImageView setImage:[UIImage imageNamed:@"index_line_0.png"]];
        [self.view addSubview:line0ImageView];
        
        [self performSelector:@selector(showLine00) withObject:nil afterDelay:10.0];
        
        line1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 582, 1024, 148)];
        [line1ImageView setAlpha:0.0];
        [line1ImageView setImage:[UIImage imageNamed:@"index_line_1.png"]];
        [self.view addSubview:line1ImageView];
        
        [self performSelector:@selector(showLine10) withObject:nil afterDelay:10.0];
        
        line2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 582, 1024, 148)];
        [line2ImageView setAlpha:0.0];
        [line2ImageView setImage:[UIImage imageNamed:@"index_line_2.png"]];
        [self.view addSubview:line2ImageView];
        
        [self performSelector:@selector(showLine20) withObject:nil afterDelay:10.0];
        
        line3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 582, 1024, 148)];
        [line3ImageView setAlpha:0.0];
        [line3ImageView setImage:[UIImage imageNamed:@"index_line_3.png"]];
        [self.view addSubview:line3ImageView];
        
        [self performSelector:@selector(showLine30) withObject:nil afterDelay:10.0];
        
        line4ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 582, 1024, 148)];
        [line4ImageView setAlpha:0.0];
        [line4ImageView setImage:[UIImage imageNamed:@"index_line_4.png"]];
        [self.view addSubview:line4ImageView];
        
        [self performSelector:@selector(showLine40) withObject:nil afterDelay:10.0];
        
        line5ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 582, 1024, 148)];
        [line5ImageView setAlpha:0.0];
        [line5ImageView setImage:[UIImage imageNamed:@"index_line_5.png"]];
        [self.view addSubview:line5ImageView];
        
        [self performSelector:@selector(showLine50) withObject:nil afterDelay:10.0];
        
        sprite0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(130, 567, 23, 34)];
        [sprite0ImageView setAlpha:0.0];
        [sprite0ImageView setImage:[UIImage imageNamed:@"index_sprite_0.png"]];
        [self.view addSubview:sprite0ImageView];
        
        [self performSelector:@selector(showSprite00) withObject:nil afterDelay:10.0];
        
        sprite1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(159, 582, 42, 60)];
        [sprite1ImageView setAlpha:0.0];
        [sprite1ImageView setImage:[UIImage imageNamed:@"index_sprite_1.png"]];
        [self.view addSubview:sprite1ImageView];
        
        [self performSelector:@selector(showSprite10) withObject:nil afterDelay:10.5f];
        
        sprite2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(218, 573, 60, 46)];
        [sprite2ImageView setAlpha:0.0];
        [sprite2ImageView setImage:[UIImage imageNamed:@"index_sprite_2.png"]];
        [self.view addSubview:sprite2ImageView];
        
        [self performSelector:@selector(showSprite20) withObject:nil afterDelay:10.7f];
        
        sprite3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(393, 533, 20, 109)];
        [sprite3ImageView setAlpha:0.0];
        [sprite3ImageView setImage:[UIImage imageNamed:@"index_sprite_3.png"]];
        [self.view addSubview:sprite3ImageView];
        
        [self performSelector:@selector(showSprite30) withObject:nil afterDelay:10.3f];
        
        sprite4ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(605, 587, 35, 50)];
        [sprite4ImageView setAlpha:0.0];
        [sprite4ImageView setImage:[UIImage imageNamed:@"index_sprite_4.png"]];
        [self.view addSubview:sprite4ImageView];
        
        [self performSelector:@selector(showSprite40) withObject:nil afterDelay:10.3f];
        
        sprite5ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(725, 558, 49, 64)];
        [sprite5ImageView setAlpha:0.0];
        [sprite5ImageView setImage:[UIImage imageNamed:@"index_sprite_5.png"]];
        [self.view addSubview:sprite5ImageView];
        
        [self performSelector:@selector(showSprite50) withObject:nil afterDelay:10.1f];
        
        sprite6ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(863, 562, 33, 62)];
        [sprite6ImageView setAlpha:0.0];
        [sprite6ImageView setImage:[UIImage imageNamed:@"index_sprite_6.png"]];
        [self.view addSubview:sprite6ImageView];
        
        [self performSelector:@selector(showSprite60) withObject:nil afterDelay:10.4f];
        
        sprite7ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(903, 538, 51, 55)];
        [sprite7ImageView setAlpha:0.0];
        [sprite7ImageView setImage:[UIImage imageNamed:@"index_sprite_7.png"]];
        [self.view addSubview:sprite7ImageView];
        
        [self performSelector:@selector(showSprite70) withObject:nil afterDelay:10.1f];
        
        /*CalculatorView *calculatorView = [[CalculatorView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [self.view addSubview:calculatorView];*/
    }
    return self;
}

- (void)updateLogo {
    //[logoImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"鲁能_00%.3d.png", logoIndex]]];
    [logoImageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"鲁能_00%.3d", logoIndex] ofType:@"png"]]];
    
    logoIndex++;
    
    if (logoIndex >= 150) {
        [timer invalidate];
    }
}

- (void)showLogo {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = logoImageView.frame;
    frame.origin.x = 322;
    [logoImageView setFrame:frame];
    [logoImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showText {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = textImageView.frame;
    frame.origin.x = 408;
    [textImageView setFrame:frame];
    [textImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showAddress {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = addressImageView.frame;
    frame.origin.x = 296;
    [addressImageView setFrame:frame];
    [addressImageView setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showButton {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = button.frame;
    frame.origin.x = 452;
    [button setFrame:frame];
    [button setAlpha:1.0];
    [UIView commitAnimations];
}

- (void)showSprite00 {
    CGRect frame = sprite0ImageView.frame;
    frame.origin.x = 130;
    [sprite0ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite0ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite01)];
    [UIView commitAnimations];
}

- (void)showSprite01 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite0ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite02)];
    [UIView commitAnimations];
}

- (void)showSprite02 {
    CGRect frame = sprite0ImageView.frame;
    frame.origin.x = 110;
    [sprite0ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite0ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite03)];
    [UIView commitAnimations];
}

- (void)showSprite03 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite0ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite04)];
    [UIView commitAnimations];
}

- (void)showSprite04 {
    CGRect frame = sprite0ImageView.frame;
    frame.origin.x = 90;
    [sprite0ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite0ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite05)];
    [UIView commitAnimations];
}

- (void)showSprite05 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite0ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite00)];
    [UIView commitAnimations];
}

- (void)showSprite10 {
    CGRect frame = sprite1ImageView.frame;
    frame.origin.x = 159;
    [sprite1ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite1ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite11)];
    [UIView commitAnimations];
}

- (void)showSprite11 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite1ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite12)];
    [UIView commitAnimations];
}

- (void)showSprite12 {
    CGRect frame = sprite1ImageView.frame;
    frame.origin.x = 139;
    [sprite1ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite1ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite13)];
    [UIView commitAnimations];
}

- (void)showSprite13 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite1ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite14)];
    [UIView commitAnimations];
}

- (void)showSprite14 {
    CGRect frame = sprite1ImageView.frame;
    frame.origin.x = 119;
    [sprite1ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite1ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite15)];
    [UIView commitAnimations];
}

- (void)showSprite15 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite1ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite10)];
    [UIView commitAnimations];
}

- (void)showSprite20 {
    CGRect frame = sprite2ImageView.frame;
    frame.origin.x = 218;
    [sprite2ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite2ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite21)];
    [UIView commitAnimations];
}

- (void)showSprite21 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite2ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite22)];
    [UIView commitAnimations];
}

- (void)showSprite22 {
    CGRect frame = sprite2ImageView.frame;
    frame.origin.x = 238;
    [sprite2ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite2ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite23)];
    [UIView commitAnimations];
}

- (void)showSprite23 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite2ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite24)];
    [UIView commitAnimations];
}

- (void)showSprite24 {
    CGRect frame = sprite2ImageView.frame;
    frame.origin.x = 258;
    [sprite2ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite2ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite25)];
    [UIView commitAnimations];
}

- (void)showSprite25 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite2ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite20)];
    [UIView commitAnimations];
}

- (void)showSprite30 {
    CGRect frame = sprite3ImageView.frame;
    frame.origin.y = 533;
    [sprite3ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite3ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite31)];
    [UIView commitAnimations];
}

- (void)showSprite31 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite3ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite32)];
    [UIView commitAnimations];
}

- (void)showSprite32 {
    CGRect frame = sprite3ImageView.frame;
    frame.origin.y = 513;
    [sprite3ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite3ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite33)];
    [UIView commitAnimations];
}

- (void)showSprite33 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite3ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite34)];
    [UIView commitAnimations];
}

- (void)showSprite34 {
    CGRect frame = sprite3ImageView.frame;
    frame.origin.y = 493;
    [sprite3ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite3ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite35)];
    [UIView commitAnimations];
}

- (void)showSprite35 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite3ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite30)];
    [UIView commitAnimations];
}

- (void)showSprite40 {
    CGRect frame = sprite4ImageView.frame;
    frame.origin.x = 605;
    [sprite4ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite4ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite41)];
    [UIView commitAnimations];
}

- (void)showSprite41 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite4ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite42)];
    [UIView commitAnimations];
}

- (void)showSprite42 {
    CGRect frame = sprite4ImageView.frame;
    frame.origin.x = 585;
    [sprite4ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite4ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite43)];
    [UIView commitAnimations];
}

- (void)showSprite43 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite4ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite44)];
    [UIView commitAnimations];
}

- (void)showSprite44 {
    CGRect frame = sprite4ImageView.frame;
    frame.origin.x = 565;
    [sprite4ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite4ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite45)];
    [UIView commitAnimations];
}

- (void)showSprite45 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite4ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite40)];
    [UIView commitAnimations];
}

- (void)showSprite50 {
    CGRect frame = sprite5ImageView.frame;
    frame.origin.x = 725;
    [sprite5ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite5ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite51)];
    [UIView commitAnimations];
}

- (void)showSprite51 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite5ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite52)];
    [UIView commitAnimations];
}

- (void)showSprite52 {
    CGRect frame = sprite5ImageView.frame;
    frame.origin.x = 745;
    [sprite5ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite5ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite53)];
    [UIView commitAnimations];
}

- (void)showSprite53 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite5ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite54)];
    [UIView commitAnimations];
}

- (void)showSprite54 {
    CGRect frame = sprite5ImageView.frame;
    frame.origin.x = 765;
    [sprite5ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite5ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite55)];
    [UIView commitAnimations];
}

- (void)showSprite55 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite5ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite50)];
    [UIView commitAnimations];
}

- (void)showSprite60 {
    CGRect frame = sprite6ImageView.frame;
    frame.origin.x = 863;
    [sprite6ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite6ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite61)];
    [UIView commitAnimations];
}

- (void)showSprite61 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite6ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite62)];
    [UIView commitAnimations];
}

- (void)showSprite62 {
    CGRect frame = sprite6ImageView.frame;
    frame.origin.x = 843;
    [sprite6ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite6ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite63)];
    [UIView commitAnimations];
}

- (void)showSprite63 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite6ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite64)];
    [UIView commitAnimations];
}

- (void)showSprite64 {
    CGRect frame = sprite6ImageView.frame;
    frame.origin.x = 823;
    [sprite6ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite6ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite65)];
    [UIView commitAnimations];
}

- (void)showSprite65 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite6ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite60)];
    [UIView commitAnimations];
}

- (void)showSprite70 {
    CGRect frame = sprite7ImageView.frame;
    frame.origin.x = 903;
    [sprite7ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite7ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite71)];
    [UIView commitAnimations];
}

- (void)showSprite71 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite7ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite72)];
    [UIView commitAnimations];
}

- (void)showSprite72 {
    CGRect frame = sprite7ImageView.frame;
    frame.origin.x = 923;
    [sprite7ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite7ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite73)];
    [UIView commitAnimations];
}

- (void)showSprite73 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite7ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite74)];
    [UIView commitAnimations];
}

- (void)showSprite74 {
    CGRect frame = sprite7ImageView.frame;
    frame.origin.x = 943;
    [sprite7ImageView setFrame:frame];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite7ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite75)];
    [UIView commitAnimations];
}

- (void)showSprite75 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationDelegate:self];
    [sprite7ImageView setAlpha:0.0];
    [UIView setAnimationDidStopSelector:@selector(showSprite70)];
    [UIView commitAnimations];
}

- (void)showLine00 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line0ImageView.frame;
    frame.origin.y = 532;
    [line0ImageView setFrame:frame];
    [line0ImageView setAlpha:0.5];
    [UIView setAnimationDidStopSelector:@selector(showLine01)];
    [UIView commitAnimations];
}

- (void)showLine01 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line0ImageView.frame;
    frame.origin.y = 582;
    [line0ImageView setFrame:frame];
    [line0ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showLine00)];
    [UIView commitAnimations];
}

- (void)showLine10 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line1ImageView.frame;
    frame.origin.y = 602;
    [line1ImageView setFrame:frame];
    [line1ImageView setAlpha:0.5];
    [UIView setAnimationDidStopSelector:@selector(showLine11)];
    [UIView commitAnimations];
}

- (void)showLine11 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line1ImageView.frame;
    frame.origin.y = 582;
    [line1ImageView setFrame:frame];
    [line1ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showLine10)];
    [UIView commitAnimations];
}

- (void)showLine20 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:4.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line2ImageView.frame;
    frame.origin.y = 552;
    [line2ImageView setFrame:frame];
    [line2ImageView setAlpha:0.5];
    [UIView setAnimationDidStopSelector:@selector(showLine21)];
    [UIView commitAnimations];
}

- (void)showLine21 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:8.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line2ImageView.frame;
    frame.origin.y = 582;
    [line2ImageView setFrame:frame];
    [line2ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showLine20)];
    [UIView commitAnimations];
}

- (void)showLine30 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:7.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line3ImageView.frame;
    frame.origin.y = 612;
    [line3ImageView setFrame:frame];
    [line3ImageView setAlpha:0.5];
    [UIView setAnimationDidStopSelector:@selector(showLine31)];
    [UIView commitAnimations];
}

- (void)showLine31 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:4.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line3ImageView.frame;
    frame.origin.y = 582;
    [line3ImageView setFrame:frame];
    [line3ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showLine30)];
    [UIView commitAnimations];
}

- (void)showLine40 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:8.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line4ImageView.frame;
    frame.origin.y = 562;
    [line4ImageView setFrame:frame];
    [line4ImageView setAlpha:0.5];
    [UIView setAnimationDidStopSelector:@selector(showLine41)];
    [UIView commitAnimations];
}

- (void)showLine41 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:9.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line4ImageView.frame;
    frame.origin.y = 582;
    [line4ImageView setFrame:frame];
    [line4ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showLine40)];
    [UIView commitAnimations];
}

- (void)showLine50 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:7.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line5ImageView.frame;
    frame.origin.y = 592;
    [line5ImageView setFrame:frame];
    [line5ImageView setAlpha:0.5];
    [UIView setAnimationDidStopSelector:@selector(showLine51)];
    [UIView commitAnimations];
}

- (void)showLine51 {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:9.0f];
    [UIView setAnimationDelegate:self];
    CGRect frame = line5ImageView.frame;
    frame.origin.y = 582;
    [line5ImageView setFrame:frame];
    [line5ImageView setAlpha:1.0];
    [UIView setAnimationDidStopSelector:@selector(showLine50)];
    [UIView commitAnimations];
}

- (void)clickButton:(id)sender {
    MainViewController *mainViewController = [[MainViewController alloc] init];
    [[[[self navigationController] view] layer] addAnimation:transition forKey:nil];
    [[self navigationController] pushViewController:mainViewController animated:NO];
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
