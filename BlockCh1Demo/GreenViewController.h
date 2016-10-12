//
//  GreenViewController.h
//  BlockCh1Demo
//
//  Created by apple on 16/10/11.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GreenViewController : UIViewController

@property (nonatomic, weak) UIView *greenView;
@property (nonatomic, weak) UILabel *lblReceive;

- (void)setGreenViewColor:(NSString *)title callBackBlock:(NSString *(^)(UIColor * color))callBackBlock;

@end
