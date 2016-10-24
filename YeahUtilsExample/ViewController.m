//
//  ViewController.m
//  YeahUtilsExample
//
//  Created by WMYeah on 2016/10/11.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage  *pathIMG = [UIImage imageWithContentsOfFile:wm_kSource_From_YeahUtilsBundle(@"beautiful_1", @"jpg", nil)];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:pathIMG];
    
    [self.view addSubview:imgView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
