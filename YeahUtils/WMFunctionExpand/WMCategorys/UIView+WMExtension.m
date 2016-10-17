//
//  UIView+WMExtension.m
//  YeahUtils
//
//  Created by WMYeah on 2016/10/13.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import "UIView+WMExtension.h"

@implementation UIView (WMExtension)

- (void)wm_settingCornerRadiusWithRadius:(CGFloat)radius rectCorners:(UIRectCorner)rectCorners;
{
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorners cornerRadii:CGSizeMake(radius,radius)];
    
    CAShapeLayer *maskLayer =  [[CAShapeLayer alloc] initWithLayer:self.layer];
    
    maskLayer.frame = self.bounds;
    ;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


- (void)wm_settingCornerRadiusWihtLeft_UP:(CGFloat)left_up left_down:(CGFloat)left_down right_up:(CGFloat)right_up right_down:(CGFloat)right_down
{
    //补充  左上角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, left_up, left_up) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(left_up, left_up)];
    
    //补充 右上角
    [maskPath appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.frame.size.width - right_up, 0, right_up, right_up) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(right_up, right_up)]];
    
    //补充 左下角
    [maskPath appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, self.frame.size.height - left_down, left_down, left_down) byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(left_down, left_down)]];
    //补充 右下角
    [maskPath appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.frame.size.width - right_down, self.frame.size.height - right_down, right_down, right_down) byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(right_down, right_down)]];
    
    
    CGFloat minNub = MIN(left_up, left_down);
    CGFloat minNub2 = MIN(minNub, right_up);
    CGFloat minNub3 = MIN(minNub2, right_down);
    
    //    中
    [maskPath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(minNub3, minNub3, self.frame.size.width - minNub3 *2, self.frame.size.height - minNub3*2)]];
    //    左
    [maskPath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(0, left_up, minNub, self.frame.size.height - left_up - left_down)]];
    //    上
    [maskPath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(left_up, 0, self.frame.size.width - left_up - right_up, MIN(left_up, right_up))]];
    //    右
    [maskPath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(self.frame.size.width - MIN(right_up, right_down), right_up, MIN(right_up, right_down), self.frame.size.height - right_up - right_down)]];
    //    下
    [maskPath appendPath:[UIBezierPath bezierPathWithRect:CGRectMake(left_down, self.frame.size.height - minNub3, self.frame.size.width - left_down - right_down, minNub3)]];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

+ (void)wm_drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

#pragma mark - View转场动画 入场、出场
+ (void)wm_animation_directWithDriection:(WM_swipeAnimationDirection)direction forView:(UIView *)view
{
    CGFloat swipeAnimationDuration = 0.2;
    
    CGRect oldFrame = view.frame;
    CGRect tempFrame = oldFrame;
    if (direction == WM_swipeAnimationDirectionFormRight) {
        tempFrame.origin.x = view.frame.size.width;
    }else{
        tempFrame.origin.x = -view.frame.size.width/2;
    }
    view.frame = tempFrame;
    view.alpha /= 5;
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:swipeAnimationDuration];
    view.frame = oldFrame;
    view.alpha *= 5;
    [UIView commitAnimations];
}
#pragma mark - 视图消失动画
+ (void)wm_animation_fadeWithType:(WM_fadeAnimationType)fadeType forView:(UIView*)view
{
    CGFloat fadeAnimationDuration = 0.2;

    CGFloat start = 0;
    CGFloat end = 0;
    if (fadeType == WM_fadeAnimationType_In) {
        start = view.alpha/4;
        end = view.alpha*4;
    }else{
        start = view.alpha;
        end = 0.5;
    }
    view.alpha = start;
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"ShowArrow" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:fadeAnimationDuration];
    view.alpha = end;
    [UIView commitAnimations];
}


@end
