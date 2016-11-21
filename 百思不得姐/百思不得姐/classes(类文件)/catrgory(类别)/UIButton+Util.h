//
//  UIButton+Util.h
//  百思不得姐
//
//  Created by 王健旭 on 2016/11/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Util)

//创建按钮的便利方法
+ (UIButton *)createBtnTitle:(NSString *)title bgImageName:(NSString *)bgImageName highlightBgImageName:(NSString *)highlightBgImageName target:(id)target action:(SEL)action;

@end
