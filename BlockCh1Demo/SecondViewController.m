//
//  SecondViewController.m
//  BlockCh1Demo
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SecondViewController.h"
#import "GreenViewController.h"

#define kScreenFrame [UIScreen mainScreen].bounds
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenFrame.size.width - 250) / 2, 200, 250, 50)];
    self.btn = btn;
    self.btn.backgroundColor = [UIColor lightGrayColor];
    [self.btn setTitle:@"Click Me, then goback! " forState:UIControlStateNormal];
    self.btn.tintColor = [UIColor blackColor];
    [self.view addSubview:self.btn];
    [self.btn addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickMe:(id)sender {

    GreenViewController *vc = self.navigationController.viewControllers[0];
    UIColor *blackColor = [UIColor blackColor];
    NSString *title = [NSString stringWithFormat:@"选中的颜色为=%@",blackColor];
    
    __weak __typeof (GreenViewController *) weakVc = vc;
    [vc setGreenViewColor:nil
            callBackBlock:^(UIColor *color) {
                
                if ([color isEqual:blackColor]) {
                    //你设置黑色将有可能不会有任何反应
                    weakVc.greenView.backgroundColor = randomColor;
                } else {
                    weakVc.greenView.backgroundColor = color;
                }
                
                weakVc.lblReceive.text = @"点击将恢复绿色！";
                return title;
            }
     ];
}

@end
