//
//  CalculatorView.m
//  LuNengTaiShan_iPad
//
//  Created by ZhongYongQiang on 9/12/16.
//  Copyright © 2016 NowUI. All rights reserved.
//

#import "CalculatorView.h"

@interface CalculatorView () <UITableViewDelegate, UITableViewDataSource> {
    UIImageView *loan0ImageView;
    UIButton *loan0Button;
    
    UIImageView *loan1ImageView;
    UIButton *loan1Button;
    
    UILabel *areaLabel;
    UIView *areaView;
    
    UILabel *priceLabel;
    UIView *priceView;
    
    UILabel *ratioLabel;
    UIPickerView *ratioPickerView;
    NSArray *ratioArray;
    
    UILabel *yearLabel;
    UIPickerView *yearPickerView;
    NSArray *yearArray;
    
    UILabel *rateLabel;
    UIPickerView *ratePickerView;
    NSArray *rateArray;
    
    UILabel *rate1Label;
    UIView *rate1View;
    NSArray *rate1Array;
    
    UIImageView *pay0ImageView;
    UIButton *pay0Button;
    
    UIImageView *pay1ImageView;
    UIButton *pay1Button;
    
    UIView *pickerMaskView;
    
    int inputType;
    NSString *area;
    NSString *price;
    int ratio;
    int year;
    int rate;
    
    UILabel *houseMoneyLabel;
    UILabel *loanMoneyLabel;
    UILabel *repaymentMoneyLabel;
    UILabel *interestMoneyLabel;
    UILabel *firstMoneyLabel;
    UILabel *monthLabel;
    UITableView *monthMoneyTableView;
    NSMutableArray *dataArray;
}

@end

@implementation CalculatorView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        ratioArray = [[NSArray alloc] initWithObjects:@"20%", @"30%", @"40%", @"50%", @"60%", @"70%", @"80%", @"90%", nil];
        yearArray = [[NSArray alloc] initWithObjects:@"5年（60期）", @"10年（120期）", @"15年（180期）", @"20年（240期）", @"25年（300期）", @"30年（360期）", nil];
        rateArray = [[NSArray alloc] initWithObjects:@"2016年1月1日利率上限（1.1倍）", @"2016年1月1日利率下限（85折）", @"2016年1月1日利率下限（7折）", @"2016年1月1日基准利率", nil];
        rate1Array = [[NSArray alloc] initWithObjects:@"5.39", @"4.17", @"3.43", @"4.90", nil];
        
        area = @"";
        price = @"";
        inputType = -1;
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [backgroundImageView setImage:[UIImage imageNamed:@"calculator_bg.png"]];
        [self addSubview:backgroundImageView];
        
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [opacityAnimation setDelegate:self];
        opacityAnimation.duration = 0.5f;
        opacityAnimation.repeatCount = HUGE_VALF;
        opacityAnimation.autoreverses = YES;
        opacityAnimation.fillMode=kCAFillModeForwards;
        opacityAnimation.removedOnCompletion = NO;
        opacityAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        opacityAnimation.toValue = [NSNumber numberWithFloat:1.0];
        
        loan0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(181, 56, 22, 22)];
        [loan0ImageView setAlpha:0.0];
        [loan0ImageView setImage:[UIImage imageNamed:@"button_combobox_active.png"]];
        [self addSubview:loan0ImageView];
        
        loan1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(342, 56, 22, 22)];
        [loan1ImageView setAlpha:0.0];
        [loan1ImageView setImage:[UIImage imageNamed:@"button_combobox_active.png"]];
        [self addSubview:loan1ImageView];
        
        loan0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [loan0Button setTag:0];
        [loan0Button setFrame:CGRectMake(181, 56, 130, 22)];
        [loan0Button addTarget:self action:@selector(clickLoanButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loan0Button];
        
        loan1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [loan1Button setTag:1];
        [loan1Button setFrame:CGRectMake(342, 56, 130, 22)];
        [loan1Button addTarget:self action:@selector(clickLoanButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loan1Button];
        
        areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(181, 101, 242, 21)];
        [areaLabel setText:@""];
        [areaLabel setTextColor:[UIColor blackColor]];
        [areaLabel setBackgroundColor:[UIColor clearColor]];
        [areaLabel setFont:[UIFont systemFontOfSize:14]];
        [areaLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:areaLabel];
        
        areaView = [[UIView alloc] initWithFrame:CGRectMake(426, 103, 2, 17)];
        [areaView setAlpha:0.0];
        [self addSubview:areaView];
        
        UIView *areaLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 17)];
        [areaLineView setBackgroundColor:[UIColor blackColor]];
        [areaLineView.layer addAnimation:opacityAnimation forKey:@"opacity"];
        [areaView addSubview:areaLineView];
        
        UIButton *areaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [areaButton setFrame:CGRectMake(181, 101, 252, 21)];
        [areaButton addTarget:self action:@selector(clickAreaButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:areaButton];
        
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(181, 145, 242, 21)];
        [priceLabel setText:@""];
        [priceLabel setTextColor:[UIColor blackColor]];
        [priceLabel setBackgroundColor:[UIColor clearColor]];
        [priceLabel setFont:[UIFont systemFontOfSize:14]];
        [priceLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:priceLabel];
        
        priceView = [[UIView alloc] initWithFrame:CGRectMake(426, 147, 2, 17)];
        [priceView setAlpha:0.0];
        [self addSubview:priceView];
        
        UIView *priceLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 17)];
        [priceLineView setBackgroundColor:[UIColor blackColor]];
        [priceLineView.layer addAnimation:opacityAnimation forKey:@"opacity"];
        [priceView addSubview:priceLineView];
        
        UIButton *priceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [priceButton setFrame:CGRectMake(181, 145, 252, 21)];
        [priceButton addTarget:self action:@selector(clickPriceButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:priceButton];
        
        ratioLabel = [[UILabel alloc] initWithFrame:CGRectMake(181, 189, 221, 21)];
        [ratioLabel setText:@""];
        [ratioLabel setTextColor:[UIColor blackColor]];
        [ratioLabel setBackgroundColor:[UIColor clearColor]];
        [ratioLabel setFont:[UIFont systemFontOfSize:14]];
        [ratioLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:ratioLabel];
        
        UIButton *ratioButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [ratioButton setFrame:CGRectMake(181, 189, 252, 21)];
        [ratioButton addTarget:self action:@selector(clickRatioButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ratioButton];
        
        yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(181, 231, 221, 21)];
        [yearLabel setText:@""];
        [yearLabel setTextColor:[UIColor blackColor]];
        [yearLabel setBackgroundColor:[UIColor clearColor]];
        [yearLabel setFont:[UIFont systemFontOfSize:14]];
        [yearLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:yearLabel];
        
        UIButton *yearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [yearButton setFrame:CGRectMake(181, 231, 252, 21)];
        [yearButton addTarget:self action:@selector(clickYearButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:yearButton];
        
        rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(181, 276, 221, 21)];
        [rateLabel setText:@""];
        [rateLabel setTextColor:[UIColor blackColor]];
        [rateLabel setBackgroundColor:[UIColor clearColor]];
        [rateLabel setFont:[UIFont systemFontOfSize:14]];
        [rateLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:rateLabel];
        
        UIButton *rateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rateButton setFrame:CGRectMake(181, 276, 252, 21)];
        [rateButton addTarget:self action:@selector(clickRateButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rateButton];
        
        rate1Label = [[UILabel alloc] initWithFrame:CGRectMake(181, 322, 85, 21)];
        [rate1Label setText:@""];
        [rate1Label setTextColor:[UIColor blackColor]];
        [rate1Label setBackgroundColor:[UIColor clearColor]];
        [rate1Label setFont:[UIFont systemFontOfSize:14]];
        [rate1Label setTextAlignment:NSTextAlignmentRight];
        [self addSubview:rate1Label];
        
        rate1View = [[UIView alloc] initWithFrame:CGRectMake(267, 325, 2, 17)];
        [rate1View setAlpha:0.0];
        [self addSubview:rate1View];
        
        UIView *rate1LineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2, 17)];
        [rate1LineView setBackgroundColor:[UIColor blackColor]];
        [rate1LineView.layer addAnimation:opacityAnimation forKey:@"opacity"];
        [rate1View addSubview:rate1LineView];
        
        UIButton *rate1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [rate1Button setFrame:CGRectMake(181, 322, 85, 21)];
        [rate1Button addTarget:self action:@selector(clickRate1Button:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rate1Button];
        
        pay0ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(181, 368, 22, 22)];
        [pay0ImageView setAlpha:0.0];
        [pay0ImageView setImage:[UIImage imageNamed:@"button_combobox_active.png"]];
        [self addSubview:pay0ImageView];
        
        pay1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(342, 368, 22, 22)];
        [pay1ImageView setAlpha:0.0];
        [pay1ImageView setImage:[UIImage imageNamed:@"button_combobox_active.png"]];
        [self addSubview:pay1ImageView];
        
        pay0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [pay0Button setTag:0];
        [pay0Button setFrame:CGRectMake(181, 368, 130, 22)];
        [pay0Button addTarget:self action:@selector(clickPayButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:pay0Button];
        
        pay1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [pay1Button setTag:1];
        [pay1Button setFrame:CGRectMake(342, 368, 130, 22)];
        [pay1Button addTarget:self action:@selector(clickPayButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:pay1Button];
        
        UIButton *number7Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number7Button setTag:7];
        [number7Button setFrame:CGRectMake(615, 120, 50, 50)];
        [number7Button setImage:[UIImage imageNamed:@"button_7.png"] forState:UIControlStateNormal];
        [number7Button setImage:[UIImage imageNamed:@"button_7_active.png"] forState:UIControlStateHighlighted];
        [number7Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number7Button];
        
        UIButton *number8Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number8Button setTag:8];
        [number8Button setFrame:CGRectMake(710, 120, 50, 50)];
        [number8Button setImage:[UIImage imageNamed:@"button_8.png"] forState:UIControlStateNormal];
        [number8Button setImage:[UIImage imageNamed:@"button_8_active.png"] forState:UIControlStateHighlighted];
        [number8Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number8Button];
        
        UIButton *number9Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number9Button setTag:9];
        [number9Button setFrame:CGRectMake(809, 120, 50, 50)];
        [number9Button setImage:[UIImage imageNamed:@"button_9.png"] forState:UIControlStateNormal];
        [number9Button setImage:[UIImage imageNamed:@"button_9_active.png"] forState:UIControlStateHighlighted];
        [number9Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number9Button];
        
        UIButton *number4Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number4Button setTag:4];
        [number4Button setFrame:CGRectMake(615, 182, 50, 50)];
        [number4Button setImage:[UIImage imageNamed:@"button_4.png"] forState:UIControlStateNormal];
        [number4Button setImage:[UIImage imageNamed:@"button_4_active.png"] forState:UIControlStateHighlighted];
        [number4Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number4Button];
        
        UIButton *number5Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number5Button setTag:5];
        [number5Button setFrame:CGRectMake(710, 182, 50, 50)];
        [number5Button setImage:[UIImage imageNamed:@"button_5.png"] forState:UIControlStateNormal];
        [number5Button setImage:[UIImage imageNamed:@"button_5_active.png"] forState:UIControlStateHighlighted];
        [number5Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number5Button];
        
        UIButton *number6Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number6Button setTag:6];
        [number6Button setFrame:CGRectMake(804, 182, 50, 50)];
        [number6Button setImage:[UIImage imageNamed:@"button_6.png"] forState:UIControlStateNormal];
        [number6Button setImage:[UIImage imageNamed:@"button_6_active.png"] forState:UIControlStateHighlighted];
        [number6Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number6Button];
        
        UIButton *number1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number1Button setTag:1];
        [number1Button setFrame:CGRectMake(615, 244, 50, 50)];
        [number1Button setImage:[UIImage imageNamed:@"button_1.png"] forState:UIControlStateNormal];
        [number1Button setImage:[UIImage imageNamed:@"button_1_active.png"] forState:UIControlStateHighlighted];
        [number1Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number1Button];
        
        UIButton *number2Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number2Button setTag:2];
        [number2Button setFrame:CGRectMake(710, 244, 50, 50)];
        [number2Button setImage:[UIImage imageNamed:@"button_2.png"] forState:UIControlStateNormal];
        [number2Button setImage:[UIImage imageNamed:@"button_2_active.png"] forState:UIControlStateHighlighted];
        [number2Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number2Button];
        
        UIButton *number3Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number3Button setTag:3];
        [number3Button setFrame:CGRectMake(804, 244, 50, 50)];
        [number3Button setImage:[UIImage imageNamed:@"button_3.png"] forState:UIControlStateNormal];
        [number3Button setImage:[UIImage imageNamed:@"button_3_active.png"] forState:UIControlStateHighlighted];
        [number3Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number3Button];
        
        UIButton *numberPointButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [numberPointButton setTag:-1];
        [numberPointButton setFrame:CGRectMake(615, 316, 50, 50)];
        [numberPointButton setImage:[UIImage imageNamed:@"button_point.png"] forState:UIControlStateNormal];
        [numberPointButton setImage:[UIImage imageNamed:@"button_point_active.png"] forState:UIControlStateHighlighted];
        [numberPointButton addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:numberPointButton];
        
        UIButton *number0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [number0Button setTag:0];
        [number0Button setFrame:CGRectMake(710, 316, 50, 50)];
        [number0Button setImage:[UIImage imageNamed:@"button_0.png"] forState:UIControlStateNormal];
        [number0Button setImage:[UIImage imageNamed:@"button_0_active.png"] forState:UIControlStateHighlighted];
        [number0Button addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:number0Button];
        
        UIButton *numberCButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [numberCButton setTag:-2];
        [numberCButton setFrame:CGRectMake(804, 316, 50, 50)];
        [numberCButton setImage:[UIImage imageNamed:@"button_c.png"] forState:UIControlStateNormal];
        [numberCButton setImage:[UIImage imageNamed:@"button_c_active.png"] forState:UIControlStateHighlighted];
        [numberCButton addTarget:self action:@selector(clickNumberButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:numberCButton];
        
        UIButton *menu0Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu0Button setFrame:CGRectMake(367, 702, 120, 32)];
        [menu0Button setImage:[UIImage imageNamed:@"calculator_button_0.png"] forState:UIControlStateNormal];
        [menu0Button addTarget:self action:@selector(clickCountButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu0Button];
        
        UIButton *menu1Button = [UIButton buttonWithType:UIButtonTypeCustom];
        [menu1Button setFrame:CGRectMake(541, 702, 120, 32)];
        [menu1Button setImage:[UIImage imageNamed:@"calculator_button_1.png"] forState:UIControlStateNormal];
        //[menu1Button addTarget:self action:@selector(clickCountButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menu1Button];
        
        houseMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 505, 161, 15)];
        [houseMoneyLabel setText:@"0.00"];
        [houseMoneyLabel setTextColor:[UIColor whiteColor]];
        [houseMoneyLabel setBackgroundColor:[UIColor clearColor]];
        [houseMoneyLabel setFont:[UIFont systemFontOfSize:18]];
        [houseMoneyLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:houseMoneyLabel];
        
        loanMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 537, 161, 15)];
        [loanMoneyLabel setText:@"0.00"];
        [loanMoneyLabel setTextColor:[UIColor whiteColor]];
        [loanMoneyLabel setBackgroundColor:[UIColor clearColor]];
        [loanMoneyLabel setFont:[UIFont systemFontOfSize:18]];
        [loanMoneyLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:loanMoneyLabel];
        
        repaymentMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 575, 161, 15)];
        [repaymentMoneyLabel setText:@"0.00"];
        [repaymentMoneyLabel setTextColor:[UIColor whiteColor]];
        [repaymentMoneyLabel setBackgroundColor:[UIColor clearColor]];
        [repaymentMoneyLabel setFont:[UIFont systemFontOfSize:18]];
        [repaymentMoneyLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:repaymentMoneyLabel];
        
        interestMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 610, 161, 15)];
        [interestMoneyLabel setText:@"0.00"];
        [interestMoneyLabel setTextColor:[UIColor whiteColor]];
        [interestMoneyLabel setBackgroundColor:[UIColor clearColor]];
        [interestMoneyLabel setFont:[UIFont systemFontOfSize:18]];
        [interestMoneyLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:interestMoneyLabel];
        
        firstMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 642, 161, 15)];
        [firstMoneyLabel setText:@"0.00"];
        [firstMoneyLabel setTextColor:[UIColor whiteColor]];
        [firstMoneyLabel setBackgroundColor:[UIColor clearColor]];
        [firstMoneyLabel setFont:[UIFont systemFontOfSize:18]];
        [firstMoneyLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:firstMoneyLabel];
        
        monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(730, 505, 161, 15)];
        [monthLabel setText:@"0"];
        [monthLabel setTextColor:[UIColor whiteColor]];
        [monthLabel setBackgroundColor:[UIColor clearColor]];
        [monthLabel setFont:[UIFont systemFontOfSize:18]];
        [monthLabel setTextAlignment:NSTextAlignmentRight];
        [self addSubview:monthLabel];
        
        monthMoneyTableView = [[UITableView alloc] initWithFrame:CGRectMake(700, 550, 213, 119) style:UITableViewStylePlain];
        [monthMoneyTableView setDelegate:self];
        [monthMoneyTableView setDataSource:self];
        [monthMoneyTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [monthMoneyTableView setShowsHorizontalScrollIndicator:NO];
        [monthMoneyTableView setShowsVerticalScrollIndicator:YES];
        [monthMoneyTableView setBackgroundView:nil];
        [monthMoneyTableView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:monthMoneyTableView];
        
        pickerMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        [pickerMaskView setAlpha:0.0];
        [pickerMaskView setBackgroundColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0.5]];
        [self addSubview:pickerMaskView];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap:)];
        [pickerMaskView addGestureRecognizer:tapGestureRecognizer];
        
        ratioPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, (768 - 216), 1024, 216)];
        [ratioPickerView setAlpha:0.0];
        [ratioPickerView setDelegate:self];
        [ratioPickerView setShowsSelectionIndicator:YES];
        [ratioPickerView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:ratioPickerView];
        
        yearPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, (768 - 216), 1024, 216)];
        [yearPickerView setAlpha:0.0];
        [yearPickerView setDelegate:self];
        [yearPickerView setShowsSelectionIndicator:YES];
        [yearPickerView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:yearPickerView];
        
        ratePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, (768 - 216), 1024, 216)];
        [ratePickerView setAlpha:0.0];
        [ratePickerView setDelegate:self];
        [ratePickerView setShowsSelectionIndicator:YES];
        [ratePickerView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:ratePickerView];
        
        [loan0ImageView setAlpha:1.0];
        [loan1ImageView setAlpha:0.0];
        
        [loan0Button setSelected:YES];
        [loan1Button setSelected:NO];
        
        ratio = 5;
        [ratioLabel setText:[ratioArray objectAtIndex:ratio]];
        
        year = 3;
        [yearLabel setText:[yearArray objectAtIndex:year]];
        
        rate = 3;
        [rateLabel setText:[rateArray objectAtIndex:rate]];
        [rate1Label setText:[rate1Array objectAtIndex:rate]];
        
        [pay0ImageView setAlpha:1.0];
        [pay1ImageView setAlpha:0.0];
        
        [pay0Button setSelected:YES];
        [pay1Button setSelected:NO];
        
        dataArray = [[NSMutableArray alloc] init];
        
        UIButton *closButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closButton setFrame:CGRectMake(962, 15, 50, 50)];
        [closButton setImage:[UIImage imageNamed:@"button_close.png"] forState:UIControlStateNormal];
        [closButton addTarget:self action:@selector(clickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closButton];
    }
    return self;
}

-(void)clickTap:(UITapGestureRecognizer*)recognizer {
    [pickerMaskView setAlpha:0.0];
    
    [ratioPickerView setAlpha:0.0];
    [yearPickerView setAlpha:0.0];
    [ratePickerView setAlpha:0.0];
}

- (void)clickLoanButton:(id)sender {
     int tag = (int) ((UIButton *)sender).tag;
    
    if(tag == 0) {
        [loan0ImageView setAlpha:1.0];
        [loan1ImageView setAlpha:0.0];
        
        [loan0Button setSelected:YES];
        [loan1Button setSelected:NO];
        
        [rate1Label setText:[rate1Array objectAtIndex:rate]];
    } else {
        [loan0ImageView setAlpha:0.0];
        [loan1ImageView setAlpha:1.0];
        
        [loan0Button setSelected:NO];
        [loan1Button setSelected:YES];
        
        [rate1Label setText:@"3.25"];
    }
}

- (void)clickAreaButton:(id)sender {
    [areaView setAlpha:1.0];
    [priceView setAlpha:0.0];
    [rate1View setAlpha:0.0];
    
    inputType = 0;
}

- (void)clickPriceButton:(id)sender {
    [areaView setAlpha:0.0];
    [priceView setAlpha:1.0];
    [rate1View setAlpha:0.0];
    
    inputType = 1;
}

- (void)clickRatioButton:(id)sender {
    [pickerMaskView setAlpha:1.0];
    
    [ratioPickerView setAlpha:1.0];
}

- (void)clickYearButton:(id)sender {
    [pickerMaskView setAlpha:1.0];
    
    [yearPickerView setAlpha:1.0];
}

- (void)clickRateButton:(id)sender {
    [pickerMaskView setAlpha:1.0];
    
    [ratePickerView setAlpha:1.0];
}

- (void)clickRate1Button:(id)sender {
    /*[areaView setAlpha:0.0];
    [priceView setAlpha:0.0];
    [rate1View setAlpha:1.0];
    
    inputType = 2;*/
}

- (void)clickPayButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    if(tag == 0) {
        [pay0ImageView setAlpha:1.0];
        [pay1ImageView setAlpha:0.0];
        
        [pay0Button setSelected:YES];
        [pay1Button setSelected:NO];
    } else {
        [pay0ImageView setAlpha:0.0];
        [pay1ImageView setAlpha:1.0];
        
        [pay0Button setSelected:NO];
        [pay1Button setSelected:YES];
    }
}

- (void)clickNumberButton:(id)sender {
    int tag = (int) ((UIButton *)sender).tag;
    
    if(inputType == 0) {
        area = [self check:area widthTag:tag];
        
        [areaLabel setText:area];
    } else if(inputType == 1) {
        price = [self check:price widthTag:tag];
        
        [priceLabel setText:price];
    } else if(inputType == 2) {
        
    }
}

- (void)clickCountButton:(id)sender {
    @try {
        float areaFloat = [area floatValue];
        
        float priceFloat = [price floatValue];
        
        float houseMoneyFloat = areaFloat * priceFloat;
        
        float ratioFloat = 3.25;
        
        if (loan0Button.isSelected) {
            if(ratio == 0) {
                ratioFloat = 0.2;
            } else if(ratio == 1) {
                ratioFloat = 0.3;
            } else if(ratio == 2) {
                ratioFloat = 0.4;
            } else if(ratio == 3) {
                ratioFloat = 0.5;
            } else if(ratio == 4) {
                ratioFloat = 0.6;
            } else if(ratio == 5) {
                ratioFloat = 0.7;
            } else if(ratio == 6) {
                ratioFloat = 0.8;
            } else if(ratio == 7) {
                ratioFloat = 0.9;
            }
        }
        
        float loanMoneyFloat = houseMoneyFloat * ratioFloat;
        
        NSString *yearString = @"";
        int yearInt = 0;
        
        if(year == 0) {
            yearString = @"60(月)";
            yearInt = 60;
        } else if(year == 1) {
            yearString = @"120(月)";
            yearInt = 120;
        } else if(year == 2) {
            yearString = @"180(月)";
            yearInt = 180;
        } else if(year == 3) {
            yearString = @"240(月)";
            yearInt = 240;
        } else if(year == 4) {
            yearString = @"300(月)";
            yearInt = 300;
        } else if(year == 5) {
            yearString = @"360(月)";
            yearInt = 360;
        }
        
        float rateFloat = [[rate1Array objectAtIndex:rate] floatValue] / 100 / 12;
        
        float monthMoneyFloat = 0.0;
        
        float repaymentMoneyFloat = 0.0;
        
        float interestMoneyFloat = 0.0;
        
        if(pay0Button.isSelected) {
            monthMoneyFloat = loanMoneyFloat * rateFloat * pow((1 + rateFloat), yearInt) / (pow((1 + rateFloat), yearInt) - 1);
            
            repaymentMoneyFloat = monthMoneyFloat * yearInt;
            
            interestMoneyFloat = repaymentMoneyFloat - loanMoneyFloat;
            
            dataArray = [[NSMutableArray alloc] init];
            
            [dataArray addObject:[NSString stringWithFormat:@"%.2f", monthMoneyFloat]];
        } else {
            float countMoney = 0.0;
            
            dataArray = [[NSMutableArray alloc] init];
            
            for(int i = 0; i < yearInt; i++) {
                monthMoneyFloat = [self countLoanMoney:loanMoneyFloat withYear:yearInt withRate:rateFloat withCountMoney:countMoney];
                
                countMoney += monthMoneyFloat;
                
                [dataArray addObject:[NSString stringWithFormat:@"%.2f", monthMoneyFloat]];
            }
        }
        
        
        [houseMoneyLabel setText:[NSString stringWithFormat:@"%.2f", houseMoneyFloat]];
        [loanMoneyLabel setText:[NSString stringWithFormat:@"%.2f", loanMoneyFloat]];
        [repaymentMoneyLabel setText:[NSString stringWithFormat:@"%.2f", repaymentMoneyFloat]];
        [interestMoneyLabel setText:[NSString stringWithFormat:@"%.2f", interestMoneyFloat]];
        
        
        [firstMoneyLabel setText:[NSString stringWithFormat:@"%.2f", houseMoneyFloat - loanMoneyFloat]];
        [monthLabel setText:yearString];
        
        [monthMoneyTableView reloadData];
        
    } @catch (NSException * e) {
        
    }
}

- (float)countLoanMoney:(float)loanMoneyFloat withYear:(int)yearInt withRate:(float)rateFloat withCountMoney:(float)countMoney {
    return loanMoneyFloat / yearInt + (loanMoneyFloat - countMoney) * rateFloat;
}

- (NSString *)check:(NSString *)str widthTag:(int)tag {
    if(tag == -2) {
        if(str.length > 0) {
            return [str substringToIndex:str.length - 1];
        } else {
            return @"";
        }
    } else if(tag == -1) {
        return [NSString stringWithFormat:@"%@.", str];
    } else {
        return [NSString stringWithFormat:@"%@%d", str, tag];
    }
}

- (void)didAreaTextFieldChange:(UITextField *)textField {
    
}

- (void)didPriceTextFieldChange:(UITextField *)textField {
    
}

- (void)clickCloseButton:(id)sender {
    [self removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if([pickerView isEqual:ratioPickerView]) {
        return [ratioArray count];
    } else if([pickerView isEqual:yearPickerView]) {
        return [yearArray count];
    } else if([pickerView isEqual:ratePickerView]) {
        return [rateArray count];
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if([pickerView isEqual:ratioPickerView]) {
        return [ratioArray objectAtIndex:row];
    } else if([pickerView isEqual:yearPickerView]) {
        return [yearArray objectAtIndex:row];
    } else if([pickerView isEqual:ratePickerView]) {
        return [rateArray objectAtIndex:row];
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if([pickerView isEqual:ratioPickerView]) {
        ratio = (int) row;
        
        [ratioLabel setText:[ratioArray objectAtIndex:ratio]];
    } else if([pickerView isEqual:yearPickerView]) {
        year = (int) row;
        
        [yearLabel setText:[yearArray objectAtIndex:year]];
    } else if([pickerView isEqual:ratePickerView]) {
        rate = (int) row;
        
        [rateLabel setText:[rateArray objectAtIndex:rate]];
        
        if (loan0Button.isSelected) {
            [rate1Label setText:[rate1Array objectAtIndex:rate]];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    if (pay0Button.isSelected) {
        cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%d月，%@", (int)indexPath.row + 1, [dataArray objectAtIndex:indexPath.row]];
    }
    [cell.textLabel setTextAlignment:NSTextAlignmentRight];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}

@end
