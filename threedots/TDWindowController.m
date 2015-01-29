//
//  TDWindowController.m
//  threedots
//
//  Created by Alex Ryan on 1/29/15.
//  Copyright (c) 2015 Alex Ryan. All rights reserved.
//

#import "TDWindowController.h"
#import "AppDelegate.h"

@interface TDWindowController ()

@end

@implementation TDWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    AppDelegate *appDelegate = [[NSApplication sharedApplication] delegate];
    appDelegate.windowController = self;
    
    self.window.titleVisibility = NSWindowTitleHidden;
    self.window.titlebarAppearsTransparent = YES;
    self.window.movableByWindowBackground = YES;

}

@end
