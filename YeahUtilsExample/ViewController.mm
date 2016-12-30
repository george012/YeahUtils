//
//  ViewController.m
//  YeahUtilsExample
//
//  Created by WMYeah on 2016/10/11.
//  Copyright © 2016年 WMYeah. All rights reserved.
//

#import "ViewController.h"
#import <ExternalAccessory/ExternalAccessory.h>

#import <sys/ioctl.h>
#import <stdio.h>
#import <string.h>
#import <stdlib.h>
#import <errno.h>
#import <unistd.h>
#import <sys/types.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <net/if.h>
#import <sys/termios.h>

@interface ViewController ()<NSStreamDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage  *pathIMG = [UIImage imageWithContentsOfFile:wm_kSource_From_YeahUtilsBundle(@"beautiful_1", @"jpg", nil)];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:pathIMG];
    
    [self.view addSubview:imgView];
    
    NSDictionary *data = @{@"status":@"1"};
    
    NSString *status = [data objectForKey:@"status"];
    NSLog(@"status%@",status);
    //        账号密码对了，把值传过去/还没写传值方法
    if ([status isEqualToString:@"0"]) {
        NSLog(@"11");
    }
    if ([status isEqualToString:@"1"]) {
        NSLog(@"22");
    }
    
    NSLog(@"%@",status);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (EASession *)openSessionForProtocol:(NSString *)protocolString
{
    NSArray *accessories = [[EAAccessoryManager sharedAccessoryManager]
                            connectedAccessories];
    EAAccessory *accessory = nil;
    EASession *session = nil;
    
    for (EAAccessory *obj in accessories) {
        if ([[obj protocolStrings] containsObject:protocolString]) {
            accessory = obj;
            break;
        }
    }
    
    if (accessory) {
        session = [[EASession alloc] initWithAccessory:accessory
                                           forProtocol:protocolString];
        if (session) {
            [[session inputStream] setDelegate:self];
            [[session inputStream] scheduleInRunLoop:[NSRunLoop currentRunLoop]
                                             forMode:NSDefaultRunLoopMode];
            [[session inputStream] open];
            [[session outputStream] setDelegate:self];
            [[session outputStream] scheduleInRunLoop:[NSRunLoop currentRunLoop]
                                              forMode:NSDefaultRunLoopMode];
            [[session outputStream] open];
        }
    }
    return session;
}

#pragma mark - 串口数据代理方法
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    switch (eventCode){
        case NSStreamEventHasBytesAvailable:
            // Process the incoming stream data.
            break;
            
        case NSStreamEventHasSpaceAvailable:
            // Send the next queued command.
            break;
            
        default:
            break;
    }
}



+(int)PKOpenSerial
{
    int fd = open("/dev/tty.iap", O_RDWR | O_NOCTTY| O_NONBLOCK);//
    if(fd == -1)
    {
        printf("open serial error!");
    }
    if (ioctl(fd, TIOCEXCL) == -1)
    {
        printf("Error setting TIOCEXCL on %s - %s(%d).\n",
               "/dev/tty.iap", strerror(errno), errno);
    }
    struct termios options;
    struct termios oldoptions;
    tcgetattr(fd,&oldoptions);
    options = oldoptions;
    //   cfmakeraw(&options);//配为原始模式
    //配置波特率为115200
    cfsetispeed(&options,B115200);
    cfsetospeed(&options,B115200);
    //    配置串口属性
    options.c_cflag |= (CLOCAL | CREAD);
    options.c_cflag &= ~PARENB;
    options.c_cflag &= ~CSTOPB;
    options.c_cflag &= ~CSIZE;
    options.c_cflag |= CS8;
    //    启用设置
    tcsetattr(fd,TCSANOW,&options);
    return fd;
}


@end
