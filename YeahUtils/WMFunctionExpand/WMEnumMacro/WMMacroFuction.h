//
//  WMMacroFuction.h
//  YeahUtils
//
//  Created by WMYeah on 2016/10/11.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

/*!
 *  weakSelf 定义函数  多用于Block
 */
#define wm_kWeakSelf(self) __weak typeof(&*self) wm_weakSelf = self

/*!
 *  App Display 名称
 */
#define wm_kSelfAppName                    NSLocalizedStringFromTable(@"CFBundleDisplayName", @"InfoPlist", nil)
/*!
 *  获取AppDelegate
 */
#define wm_kSelfAppDelegate                (AppDelegate *)[[UIApplication sharedApplication] delegate]

#define wm_kSelfAppBundleID                [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

#define wm_kSelfAppBundleName              [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]

#define wm_kSelfAppCurrentVersion          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define wm_kSelfAppCurrentVersion_Code     [kSelfAppCurrentVersion stringByReplacingOccurrencesOfString:@"." withString:@""]


#define wm_kBundle_Souce_YeahUtils         [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"YeahUtilsSource" ofType:@"bundle"]]

#define wm_kSource_From_YeahUtilsBundle(fileName,fileType,subDirectory)         [wm_kBundle_Souce_YeahUtils pathForResource:fileName ofType:fileType inDirectory:subDirectory?subDirectory:@""]

/*!
 *  Log 自定义
 */
#ifdef DEBUG
#define wm_kLog(format, ...)            NSLog((@"\n\n  文件名  =  %s" "\n  函数名  =  %s" "\n  行号  =  %d\n  MSG  =  \n\n" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define wm_kLog(...)          NSLog(__VA_ARGS__)
#endif
