//
//  QQAccount.h
//  libqq-adium
//
//  Created by William Orr on 11/19/11.
//  Copyright (c) 2011 William Orr. All rights reserved.
//

#import <AdiumLibpurple/CBPurpleAccount.h>

@interface QQAccount : CBPurpleAccount {
    
}

#define KEY_QQ_TCP_CONNECT @"use_tcp"
#define DEFAULT_PORT @"8000"
#define QQ_NETWORK_ERROR @"QQNetworkError"

@end
