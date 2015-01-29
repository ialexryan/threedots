//
//  ViewController.m
//  threedots
//
//  Created by Alex Ryan on 1/28/15.
//  Copyright (c) 2015 Alex Ryan. All rights reserved.
//

#import "ViewController.h"
@import WebKit;

@implementation ViewController

- (void)viewWillAppear {
    [super viewWillAppear];
    
    NSLog(@"%@", self.view.window);
    self.view.window.titleVisibility = NSWindowTitleHidden;
    self.view.window.titlebarAppearsTransparent = YES;
    self.view.window.movableByWindowBackground = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    NSURL *url=[NSURL URLWithString:@"http://app.asana.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    webView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
