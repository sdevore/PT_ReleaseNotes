//
//  AppDelegate.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/12/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // setup logging

    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    XCDLumberjackNSLogger *logger = [XCDLumberjackNSLogger new];
    [DDLog addLogger:logger withLevel:DDLogLevelAll]; // normally DDLogLevelWarning | DDLogLevelErrorn
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[NSColor greenColor]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagDebug];
    [[DDTTYLogger sharedInstance] setForegroundColor:[NSColor blueColor]
                                     backgroundColor:nil
                                             forFlag:DDLogFlagInfo];
    


    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
