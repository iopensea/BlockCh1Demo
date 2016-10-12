//
//  GreenViewController.m
//  BlockCh1Demo
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GreenViewController.h"
#import "SecondViewController.h"

#define kScreenFrame [UIScreen mainScreen].bounds

@interface GreenViewController () <UIGestureRecognizerDelegate> {
    UIColor *greenColor;
}

@property(nullable,nonatomic,weak) id <UIGestureRecognizerDelegate> delegate;
@property (nonatomic) NSUInteger  numberOfTapsRequired;

@end

@implementation GreenViewController

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *greenView = [[UIView alloc]initWithFrame:CGRectMake((kScreenFrame.size.width - 250) / 2, 164, 250, 250)];
    self.greenView = greenView;
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    self.greenView.userInteractionEnabled = YES;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((kScreenFrame.size.width - 200) / 2, 164 + 50, 200, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    self.lblReceive = label;
    [self.view addSubview:self.lblReceive];
    
    // 创建一个手势对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeColor)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.greenView addGestureRecognizer:tap];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenFrame.size.width - 300) / 2, 164 + self.greenView.frame.size.height + 50, 300, 50)];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.tintColor = [UIColor blackColor];
    [btn setTitle:@"gotoSecondViewController" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(goSecond) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeColor {
    greenColor = [UIColor greenColor];
    self.greenView.backgroundColor = greenColor;
    
    NSLog(@"已经恢复绿色！");
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isKindOfClass:[UIButton class]])    {
        return NO;    }
    return YES;
}

- (void)goSecond {
    SecondViewController *second = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:second animated:NO];
}

- (void)setGreenViewColor:(NSString *)title callBackBlock: (NSString *(^)(UIColor *))callBackBlock {
    
    NSString *returnMessage = @"";
    
    returnMessage = callBackBlock([UIColor brownColor]);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@,但绝对不会显示红色，不要问我为什么！",returnMessage);
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
