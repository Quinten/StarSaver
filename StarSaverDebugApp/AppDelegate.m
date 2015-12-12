//
//  AppDelegate.m
//  StarSaverDebugApp
//
//  Created by Quinten Clause on 12/12/15.
//  Copyright © 2015 Quinten Clause. All rights reserved.
//

#import "AppDelegate.h"
#import "StarSaverView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    StarSaverView *testView = [[StarSaverView alloc] initWithFrame:self.window.contentView.frame isPreview:NO];
    [[self.window contentView] addSubview:testView];
    NSLog(@"test");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
