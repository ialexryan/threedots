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
    NSString *jsURLString = @"https://gist.github.com/raw/bf025703e11ee18c3dd1/";
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
    
    NSURL *url=[NSURL URLWithString:@"https://app.asana.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    
    [self.view addSubview:webView];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

@end