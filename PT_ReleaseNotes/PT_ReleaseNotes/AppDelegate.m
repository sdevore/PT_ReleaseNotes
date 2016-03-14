//
//  AppDelegate.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/12/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "AppDelegate.h"
#import "DMKevlarApplication.h"
#import <DevMateKit/DevMateKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate
+ (NSURLSession *)sharedSession {
    static NSURLSession *_sharedSession = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];

        /* Create session, and optionally set a NSURLSessionDelegate. */
        _sharedSession = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:nil];
        ;
    });

    return _sharedSession;
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // setup logging
    [DevMateKit sendTrackingReport:nil delegate:nil];
    [DevMateKit setupIssuesController:nil reportingUnhandledIssues:YES];
    if (!DMKIsApplicationActivated(NULL)) {
        [DevMateKit setupTimeTrial:nil withTimeInterval:kDMTrialWeek];
    }
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    XCDLumberjackNSLogger *logger = [XCDLumberjackNSLogger new];
    [DDLog addLogger:logger withLevel:DDLogLevelAll]; // normally DDLogLevelWarning | DDLogLevelErrorn
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[NSColor greenColor] backgroundColor:nil forFlag:DDLogFlagDebug];
    [[DDTTYLogger sharedInstance] setForegroundColor:[NSColor blueColor] backgroundColor:nil forFlag:DDLogFlagInfo];


    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showFeedbackDialog:(id)sender {
    [DevMateKit showFeedbackDialog:nil inMode:DMFeedbackDefaultMode];
}

- (IBAction)startActivationProcess:(id)sender {
    if (!DMKIsApplicationActivated(NULL)) {
        [DevMateKit runActivationDialog:nil inMode:DMActivationModeFloating];
    }
}
@end
