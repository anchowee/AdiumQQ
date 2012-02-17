//
//  QQAccount.m
//  libqq-adium
//
//  Created by William Orr on 11/19/11.
//  Copyright (c) William Orr. All rights reserved.
//

#import "QQAccount.h"

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

@end
