//
//  QQAccount.m
//  libqq-adium
//
//  Created by William Orr on 11/19/11.
//  Copyright (c) William Orr. All rights reserved.
//

#import "QQAccount.h"
#import "QQService.h"
#import <stdlib.h>

@implementation QQAccount

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
    NSString* server;
    NSArray* serverList;
    serverList = [QQService getServerList:[[self preferenceForKey:KEY_QQ_TCP_CONNECT group:GROUP_ACCOUNT_STATUS] boolValue]];
    
    server = [serverList objectAtIndex:(arc4random() % [serverList count])];
    server = [[server stringByAppendingString:@":"] stringByAppendingString:DEFAULT_PORT];
    purple_account_set_string(account, 
                              [KEY_QQ_CONNECT_HOST UTF8String], 
                              [server UTF8String]);
}

@end
