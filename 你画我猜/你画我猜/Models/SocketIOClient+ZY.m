//
//  SocketIOClient+ZY.m
//  你画我猜
//
//  Created by ZYSu on 2017/12/12.
//  Copyright © 2017年 ZYSu. All rights reserved.
//

#import "SocketIOClient+ZY.h"

@implementation SocketIOClient (ZY)

+ (instancetype)sharedClient
{
    static SocketIOClient *client;
    if (client == nil) {
        client = [[SocketIOClient alloc] initWithSocketURL:[NSURL URLWithString:@"ws://192.168.0.76:3000"] config:nil];
    }
    return client;
}

@end
