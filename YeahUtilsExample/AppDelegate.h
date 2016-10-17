//
//  AppDelegate.h
//  YeahUtilsExample
//
//  Created by WMYeah on 2016/10/11.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

