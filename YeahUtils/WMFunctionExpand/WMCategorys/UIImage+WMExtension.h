//
//  UIImage+WMExtension.h
//  YeahUtils
//
//  Created by WMYeah on 2016/10/13.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WMExtension)
/*!
 更改图片圆角度数
 
 @param degrees 圆角度数
 
 @return 返回更改后的图片
 */
- (UIImage*)wm_imageRotatedByDegrees:(CGFloat)degrees;

/**
 更改图片的颜色
 
 @param color 要更改的颜色
 
 @return 返回新的图片
 */
- (UIImage *)wm_setImageColorWithColor:(UIColor *)color;
@end
