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
    
    NSURL *url=[NSURL URLWithString:@"https://app.asana.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    
    [self.view addSubview:webView];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSURL *destinationURL = navigationAction.request.URL;
    
    // If the URL doesn't end in .asana.com and was manually clicked by the user
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated && (![destinationURL.host.lowercaseString hasSuffix:@".asana.com"])){
        // Open in the default browser
        [[NSWorkspace sharedWorkspace] openURL:destinationURL];
        // And don't go there in the WKWebView
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end