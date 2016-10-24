//
//  UIView+WMExtension.h
//  YeahUtils
//
//  Created by WMYeah on 2016/10/13.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 View转场动画类型

 - FadeAnimationIn:  出现
 - FadeAnimationOut: 消失
 */
typedef NS_ENUM(NSInteger, WM_fadeAnimationType) {
    WM_fadeAnimationType_In,
    WM_fadeAnimationType_Out
};


/**
 滑动动画类型
 
 - WM_swipeAnimationDirectionFormLeft:  从左滑动
 - WM_swipeAnimationDirectionFormRight: 从右滑动
 */
typedef NS_ENUM(NSInteger, WM_swipeAnimationDirection) {
    WM_swipeAnimationDirectionFormLeft,
    WM_swipeAnimationDirectionFormRight
};



@interface UIView (WMExtension)

/**
 自定义View圆角度数

 @param left_up    左上角 弧度
 @param left_down  左下角 弧度
 @param right_up   右上角 弧度
 @param right_down 右下角 弧度
 */
- (void)wm_settingCornerRadiusWihtLeft_UP:(CGFloat)left_up left_down:(CGFloat)left_down right_up:(CGFloat)right_up right_down:(CGFloat)right_down;

/**
 绘制虚线
 @param lineView       需要绘制成虚线的view
 @param lineLength     虚线的宽度
 @param lineSpacing    虚线的间距
 @param lineColor      虚线的颜色
 */
+ (void)wm_drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 设置圆角
 
 @param radius          弧度
 @param rectCorners     位置角  可以组合使用 UIRectCornerTopLeft | UIRectCornerTopRight
 */
- (void)wm_settingCornerRadiusWithRadius:(CGFloat)radius rectCorners:(UIRectCorner)rectCorners;


#pragma mark - Animations Categorys
/**
 View转场动画
 */
+ (void)wm_animation_directWithDriection:(WM_swipeAnimationDirection)direction forView:(UIView *)view;
/**
 视图消失动画
 */
+ (void)wm_animation_fadeWithType:(WM_fadeAnimationType)fadeType forView:(UIView*)view;



@end
