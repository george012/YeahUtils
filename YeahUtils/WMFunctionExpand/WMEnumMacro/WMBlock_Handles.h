//
//  WMBlock_Handles.h
//  YeahUtils
//
//  Created by WMYeah on 16/9/29.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

/*!
 *  常规处理Block  无返回值  无传参
 */
typedef void(^WM_Util_handleBlcok_Normal)();

/*!
 *  处理Block
 *
 *  @param complate blcok处理完成后传参
 *  @param error    error  nil 正常 其他值参照接口定义
 */
typedef void(^WM_Util_handleBlcok_Complate)(BOOL complate, NSError *error);

/*!
 *  带自定义参数的Block处理
 *
 *  @param complate 完成了标识
 *  @param Response Block传递参数
 *  @param error    错误信息
 */
typedef void(^WM_Util_handleBlcok_Complate_Response)(id Response,NSError *error);
