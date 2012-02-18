//
//  QQService.m
//  libqq-adium
//
//  Created by William Orr on 11/19/11.
//  Copyright (c) 2011 William Orr. All rights reserved.
//

#import "QQService.h"

#import "QQAccount.h"
#import "QQAccountViewController.h"

#import <Adium/AIStatusControllerProtocol.h>
#import <Adium/AISharedAdium.h> 
#import <AIUtilities/AIImageAdditions.h>

@implementation QQService

- (void) registerStatuses {
    [[adium statusController] registerStatus:STATUS_NAME_AVAILABLE 
                             withDescription:[[adium statusController] localizedDescriptionForCoreStatusName:STATUS_NAME_AVAILABLE] 
                             ofType:AIAvailableStatusType
                             forService:self];
    [[adium statusController] registerStatus:STATUS_NAME_AWAY
                             withDescription:[[adium statusController]
                                localizedDescriptionForCoreStatusName:STATUS_NAME_AWAY]
                             ofType:AIAwayStatusType 
                             forService:self];
    [[adium statusController] registerStatus:STATUS_NAME_INVISIBLE
                             withDescription:[[adium statusController]
                                localizedDescriptionForCoreStatusName:STATUS_NAME_INVISIBLE]
                             ofType:AIInvisibleStatusType 
                             forService:self];
    [[adium statusController] registerStatus:STATUS_NAME_BUSY
							 withDescription:[[adium statusController] localizedDescriptionForCoreStatusName:STATUS_NAME_BUSY]
                             ofType:AIAwayStatusType
                             forService:self];
}

- (Class) accountClass {
    return [QQAccount class];
}

- (AIAccountViewController*) accountViewController {
    return [QQAccountViewController accountViewController];
}

- (NSString*) serviceCodeUniqueID {
    return @"libpurple-qq";
}

- (NSString*) serviceID {
    return @"QQ";
}

- (NSString*) serviceClass {
    return @"QQ";
}

- (NSString*) shortDescription {
    return @"QQ";
}

- (NSString*) longDescription {
    return @"Tencent QQ";
}

- (NSString*) userNameLabel {
    return @"QQ UID";
}

- (NSString*) contactUserNameLabel {
    return @"Contact UID";
}

- (NSCharacterSet*) allowedCharactersForAccountName {
    return [NSCharacterSet alphanumericCharacterSet];
}

- (NSCharacterSet*) allowedCharactersForUIDs {
    return [NSCharacterSet decimalDigitCharacterSet];
}

- (BOOL) caseSensitive {
    return YES;
}

- (BOOL) requiresPassword {
    return YES;
}

- (NSUInteger) allowedLengthForUIDs {
    return 11;
}

- (BOOL) canCreateGroupChats {
    return YES;
}

- (AIServiceImportance) serviceImportance {
    return AIServiceSecondary;
}

- (NSImage *)defaultServiceIconOfType:(AIServiceIconType)iconType {
	NSImage *baseImage = [NSImage imageNamed:@"QQ" forClass:[self class]];
    
	if (iconType == AIServiceIconSmall) {
        [baseImage setSize:NSMakeSize(16, 16)];
	}
    
	return baseImage;
}

+ (NSArray*) getServerList:(BOOL)tcp {
    if (tcp) {
        return [[[NSArray alloc] initWithObjects:
                 @"tcpconn.tencent.com",
                 @"tcpconn2.tencent.com",
                 @"tcpconn3.tencent.com",
                 @"tcpconn4.tencent.com",
                 @"tcpconn5.tencent.com",
                 @"tcpconn6.tencent.com", 
                 nil] autorelease];
    }
    
    return [[[NSArray alloc] initWithObjects:                   
             @"sz.tencent.com",
             @"sz2.tencent.com",
             @"sz3.tencent.com",
             @"sz4.tencent.com",
             @"sz5.tencent.com",
             @"sz6.tencent.com",
             @"sz7.tencent.com",
             @"sz8.tencent.com",
             @"sz9.tencent.com",
             @"butts.com",
             nil] autorelease];
}

@end
