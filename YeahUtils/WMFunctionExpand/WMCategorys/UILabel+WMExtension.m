//
//  UILabel+WMExtension.m
//  YeahUtils
//
//  Created by WMYeah on 2016/10/13.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import "UILabel+WMExtension.h"

@implementation UILabel (WMExtension)

- (instancetype)wm_initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:( NSTextAlignment)textAlignment adjustsFontSizeToFitWidth:(BOOL)isAdjusts
{
    UILabel *cuLable = [super initWithFrame:frame];
    
    if (backgroundColor) {
        [cuLable setBackgroundColor:backgroundColor];
    }
    
    if (text) {
        [cuLable setText:text];
    }
    
    if (textColor) {
        [cuLable setTextColor:textColor];
    }
    
    if (font) {
        [cuLable setFont:font];
    }
    
    if (textAlignment) {
        [cuLable setTextAlignment:textAlignment];
    }
    
    if (isAdjusts == YES) {
        [cuLable setAdjustsFontSizeToFitWidth:isAdjusts];
    }
    
    return cuLable;
}

@end
