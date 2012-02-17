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

- (void) switchServer {
    NSAlert* alert = [[NSAlert alloc] init];
    alert.messageText = @"QQ network error. Please try selecting a different server in the preferences dialog.";
    [alert runModal];
}

@end
