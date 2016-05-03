//
//  AppDelegate.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/12/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

+ (nonnull NSURLSession *)sharedSession;

- (IBAction)showFeedbackDialog:(nullable id)sender;
- (IBAction)startActivationProcess:(nullable id)sender;
@end
