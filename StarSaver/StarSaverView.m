//
//  StarSaverView.m
//  StarSaver
//
//  Created by Quinten Clause on 11/12/15.
//  Copyright (c) 2015 Quinten Clause. All rights reserved.
//

#import "StarSaverView.h"

@implementation StarSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    if (!(self = [super initWithFrame:frame isPreview:isPreview])) return nil;
    
    NSURL* indexHTMLDocumentURL = [NSURL fileURLWithPath:[[NSBundle bundleForClass:self.class].resourcePath stringByAppendingString:@"/index.html"] isDirectory:NO];
    
    WebView* webView = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, frame.size.width, frame.size.height)];
    webView.frameLoadDelegate = self;
    webView.drawsBackground = NO; // Disables the white flash
    [webView.mainFrame loadRequest:[NSURLRequest requestWithURL:indexHTMLDocumentURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0]];
    [self addSubview:webView];
    
    return self;
}

#pragma mark - ScreenSaverView

- (void)animateOneFrame { [self stopAnimation]; } // Animation is in the index.html itself
- (BOOL)hasConfigureSheet { return NO; } // There is no configuration

#pragma mark - WebFrameLoadDelegate

- (void)webView:(WebView *)sender didFailLoadWithError:(NSError *)error forFrame:(WebFrame *)frame {
    NSLog(@"%@ error=%@", NSStringFromSelector(_cmd), error);
}

#pragma mark Input Overrides

// Some methods that captures all the input events to prevent the webview from gaining focus.

- (NSView *)hitTest:(NSPoint)aPoint {
    return self;
}

/*
- (void)keyDown:(NSEvent *)theEvent {
    return;
}

- (void)keyUp:(NSEvent *)theEvent {
    return;
}
*/

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)resignFirstResponder {
    return NO;
}

@end
