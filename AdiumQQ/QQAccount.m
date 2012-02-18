//
//  QQAccount.m
//  libqq-adium
//
//  Created by William Orr on 11/19/11.
//  Copyright (c) William Orr. All rights reserved.
//

#import "QQAccount.h"
#import "QQService.h"
#include <stdlib.h>

@implementation QQAccount

- (void) initAccount {
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(switchServer) 
                                                 name:QQ_NETWORK_ERROR
                                               object:nil];
}

- (const char*) protocolPlugin {
    return "prpl-qq";
}

- (BOOL) canSendFolders {
    return NO;
}

- (void) beginSendOfFileTransfer:(ESFileTransfer *)fileTransfer {
    return [super _beginSendOfFileTransfer:fileTransfer];
}

- (void) accountConnectionReportDisconnect:(NSString *)text withReason:(PurpleConnectionError)reason {
    if (reason == PURPLE_CONNECTION_ERROR_NETWORK_ERROR) {
        [[NSNotificationCenter defaultCenter] postNotificationName:QQ_NETWORK_ERROR object:nil];
    }
    
    [super accountConnectionReportDisconnect:text withReason:reason];
}

/*
 * On network error, select a different server from the list, and try to connect again.
 */
- (void) switchServer {
    NSArray* servers = [QQService getServerList:[[self preferenceForKey:KEY_QQ_TCP_CONNECT group:GROUP_ACCOUNT_STATUS] boolValue]];
    NSString* server = [servers objectAtIndex:(arc4random() % [servers count])];
    [self setPreference:server forKey:KEY_CONNECT_HOST group:GROUP_ACCOUNT_STATUS]  ;
    purple_account_set_string([self purpleAccount], [KEY_QQ_CONNECT_HOST UTF8String], [server UTF8String]);
    [self connect];
}

@end
