//
//  CalculatorView.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "CalculatorView.h"

@implementation CalculatorView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"calculator_bg.png"]];
        [self addSubview:backgroundImageView];
        
        UITextField *areaTextField = [[UITextField alloc] initWithFrame:CGRectMake(181, 127, 252, 21)];
        [areaTextField setFont:[UIFont systemFontOfSize:14]];
        [areaTextField setBorderStyle:UITextBorderStyleNone];
        [areaTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [areaTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [areaTextField setReturnKeyType:UIReturnKeyDone];
        [areaTextField setClearButtonMode:UITextFieldViewModeNever];
        [areaTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [areaTextField setBackgroundColor:[UIColor clearColor]];
        [areaTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [areaTextField addTarget:self action:@selector(didAreaTextFieldChange:)forControlEvents:UIControlEventEditingChanged];
        [self addSubview:areaTextField];
        
        UITextField *priceTextField = [[UITextField alloc] initWithFrame:CGRectMake(181, 171, 252, 21)];
        [priceTextField setFont:[UIFont systemFontOfSize:14]];
        [priceTextField setBorderStyle:UITextBorderStyleNone];
        [priceTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [priceTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [priceTextField setReturnKeyType:UIReturnKeyDone];
        [priceTextField setClearButtonMode:UITextFieldViewModeNever];
        [priceTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [priceTextField setBackgroundColor:[UIColor clearColor]];
        [priceTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [priceTextField addTarget:self action:@selector(didPriceTextFieldChange:)forControlEvents:UIControlEventEditingChanged];
        [self addSubview:priceTextField];
        
        /*UIPickerView *ratioPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, (768 - 216), 1024, 216)];
        [ratioPickerView setDelegate:self];
        [ratioPickerView setShowsSelectionIndicator:YES];
        [ratioPickerView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:ratioPickerView];*/
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(962, 15, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
    }
    return self;
}

- (void)didAreaTextFieldChange:(UITextField *)textField {
    
}

- (void)didPriceTextFieldChange:(UITextField *)textField {
    
}

- (void)clickCloseButton:(id)sender {
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return @"";
}

@end
