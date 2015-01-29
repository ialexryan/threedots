//
//  AppDelegate.m
//  threedots
//
//  Created by Alex Ryan on 1/28/15.
//  Copyright (c) 2015 Alex Ryan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    if (flag == NO) {
        [self.windowController.window makeKeyAndOrderFront:self];
    }
    return YES;
}

@end
