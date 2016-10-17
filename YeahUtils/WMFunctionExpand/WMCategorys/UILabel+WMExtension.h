//
//  UILabel+WMExtension.h
//  YeahUtils
//
//  Created by WMYeah on 2016/10/13.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WMExtension)

/**
 快速初始化方法

 @param frame           frame
 @param backgroundColor 背景颜色
 @param text            文本
 @param textColor       文本颜色
 @param font            字体
 @param textAlignment   文本对齐方式
 @param isAdjusts       内容是否自适应窗口大小

 @return 返回Lable
 */
- (instancetype)wm_initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:( NSTextAlignment)textAlignment adjustsFontSizeToFitWidth:(BOOL)isAdjusts;

@end
