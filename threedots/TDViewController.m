//
//  TDViewController.m
//  threedots
//
//  Created by Alex Ryan on 1/29/15.
//  Copyright (c) 2015 Alex Ryan. All rights reserved.
//

#import "TDViewController.h"
@import WebKit;

@implementation TDViewController

- (NSString*)fetchJSSourceString {
    NSString *jsURLString = @"http://threedotsapp.com/threedots.js";
    NSURL *jsURL = [NSURL URLWithString:jsURLString];
    NSString *jsSourceString = [NSString stringWithContentsOfURL:jsURL encoding:NSUTF8StringEncoding error:nil];
    return jsSourceString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:[self fetchJSSourceString] injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    [userContentController addUserScript:userScript];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = userContentController;
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    webView.navigationDelegate = self;
    webView.UIDelegate = self;
    
    NSURL *url=[NSURL URLWithString:@"https://app.asana.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    
    [self.view addSubview:webView];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSURL *destinationURL = navigationAction.request.URL;
    
    // If the URL
    //  (was manually clicked by the user                                  AND (doesn't end in .asana.com                                       OR contains the "download_asset" string)
    if ((navigationAction.navigationType == WKNavigationTypeLinkActivated) && ((![destinationURL.host.lowercaseString hasSuffix:@".asana.com"]) || [destinationURL.absoluteString containsString:@"app.asana.com/app/asana/-/download_asset?asset_id="])){
        // Then open it in the default browser
        [[NSWorkspace sharedWorkspace] openURL:destinationURL];
        // And don't open it in the WKWebView
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)())completionHandler
{
    NSAlert *alert = [[NSAlert alloc] init];
    alert.messageText = message;
    if ([message isEqual: @"Threedots does not currently support Google login.\nPlease open app.asana.com in Safari, log in, and then relaunch threedots."])
    {
        alert.messageText = @"Threedots doesn't support Google login.";
        alert.informativeText = @"Simply click the button below to sign in with Safari, then relaunch threedots.";
        [alert addButtonWithTitle:@"Quit threedots and log in with Safari"];
        [alert runModal];
        [[NSWorkspace sharedWorkspace] openURLs:@[[NSURL URLWithString:@"http://app.asana.com"]] withAppBundleIdentifier:@"com.apple.Safari" options:NSWorkspaceLaunchDefault additionalEventParamDescriptor:NULL launchIdentifiers:NULL];
        [NSApp terminate:nil];
    }
    else {
        alert.messageText = message;
         [alert runModal];
    }
    completionHandler();
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end