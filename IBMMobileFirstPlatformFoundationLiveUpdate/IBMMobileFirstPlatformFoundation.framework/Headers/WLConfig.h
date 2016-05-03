/*
 * Licensed Materials - Property of IBM
 * 5725-I43 (C) Copyright IBM Corp. 2006, 2013. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

//
//  WLConfig.h
//  Worklight SDK
//
//  Created by Benjamin Weingarten on 2/24/10.
//  Copyright (C) Worklight Ltd. 2006-2012.  All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WLConfig : NSObject <NSXMLParserDelegate> {
    
    NSDictionary *mfpProperties;
    NSXMLParser *xmlP;
}

+ (WLConfig *)instance;
-(NSString *)getRootURL;
-(NSString *)getRootURLForDirectUpdate;
-(NSString *)getRootURLForDevServices;
-(NSString *)getApplicationVersion;
-(NSString *)getApplicationName;
-(NSString *)getClientPlatform;
-(NSString *)getBuildTime;
-(NSString *)getMainHtmlFileName;
-(NSString *)getBaseURL;
-(NSString *)getContext;
-(NSMutableDictionary *) getClientData;
-(NSString *)getLanguagePreferences;
-(NSString *)isIgnoreAddingBackgroundToDirectUpdate;
-(void)setBaseURL :(NSString *)url;
-(NSDictionary *) getApplicationData;
-(NSString *)getPlatformVersion;
-(NSString *)getMainFilePath;
-(NSString *)getUserCertificateAccessGroup;

-(NSArray *)getSharedCookies;
-(NSString *)getWLGroupName;

-(NSString *) getInProgressChecksumPref;
-(void) setInProgressChecksumPref :(NSString *)updateChecksum;
-(NSString *)getWLPublicKey;

@property (nonatomic, strong, readonly) NSDictionary *mfpProperties;
@property (nonatomic, strong) NSXMLParser *xmlP;
@property (nonatomic) long serverRelativeTime;

extern double const DEFAULT_TIMEOUT_IN_SECONDS;
extern NSString * const APPLICATION_VERSION_HEADER;
extern NSString * const WL_PLATFORM_VERSION_HEADER;
extern NSString * const WL_DEVICE_ID_HEADER;
extern NSString * const NOTIFICATION_SUBSCRIPTION_STATE_KEY;
extern NSString * const NOTIFICATION_SUBSCRIPTION_STATE_TOKEN_KEY;
extern NSString * const NOTIFICATION_SUBSCRIPTION_STATE_EVENT_SOURCES_KEY;
extern NSString * const NOTIFICATION_SUBSCRIPTION_STATE_EVENT_SOURCES_ADAPTER_KEY;
extern NSString * const NOTIFICATION_SUBSCRIPTION_STATE_EVENT_SOURCES_EVENT_SOURCE_KEY;

@end
