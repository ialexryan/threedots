//
//  GlobalVars.h
//  threedots
//
//  Created by Alex Ryan on 1/28/15.
//  Copyright (c) 2015 Alex Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WKWebView;

@interface GlobalVars : NSObject

+ (GlobalVars *)sharedInstance;

@property (strong, nonatomic, readwrite) WKWebView *webView;

@end
