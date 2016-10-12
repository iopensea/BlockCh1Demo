//
//  ViewController.m
//  BlockCh1Demo
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

typedef void (^BlockTwo) (NSString *a, UIColor *b);

@interface ViewController () {
    
}

@property (nonatomic, copy) BlockTwo blockTwo;

@property (nonatomic, copy) void (^blockThree)(NSString *a, NSString *b);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // test 1
//    [self blockOneMethod];
    
    //test 2
//    __weak ViewController *wSelf = self;
    __weak __typeof (self)weakSelf = self;
    
    ViewController *vc = [[ViewController alloc] init];
    vc.blockTwo = ^ (NSString *a, UIColor *b) {
        
        NSLog(@"a=%@",a);
        weakSelf.view.backgroundColor = b;
    };
    
    [self.navigationController pushViewController:vc animated:YES];
    self.blockThree = ^(NSString *a, NSString *b) {
        
    };
}

- (void)blockTwoMethod:(BlockTwo)blockTwo {
    
}

- (void)blockThreeMethod:(void (^)(NSString *a, NSString *b))blockThree {
    
}

- (void)blockOneMethod {
    NSLog(@"%s",__func__);
    
//    __block int b = 0;
    int b = 0;
    void (^blo)(int a) = ^(int a){
        NSLog(@"Input:b=%d, a=%d",b,a);
    };
    
    b = 3;
    blo(b);
    
    /** result:
     *
     *    Input:b=0
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
