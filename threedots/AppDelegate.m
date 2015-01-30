//
//  AppDelegate.m
//  threedots
//
//  Created by Alex Ryan on 1/28/15.
//  Copyright (c) 2015 Alex Ryan. All rights reserved.
//

#import "AppDelegate.h"
#import "TDWindowController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

// This shows the app if the window is closed and the user clicks on the dock icon
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    if (flag == NO) {
        [self.windowController.window makeKeyAndOrderFront:self];
    }
    return YES;
}

// This shows the app if the window is closed and the user command-tabs to the application
- (void)applicationWillBecomeActive:(NSNotification *)notification {
    [self.windowController.window makeKeyAndOrderFront:self];
}


// If the user clicks file > new, make a new window
- (IBAction)newWindow:(id)sender {
//    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    TDWindowController *wc =[sb instantiateInitialController];
//    [wc.window makeKeyAndOrderFront:self];
}

@end
