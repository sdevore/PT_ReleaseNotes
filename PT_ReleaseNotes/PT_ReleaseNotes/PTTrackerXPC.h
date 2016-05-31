//
//  PTTrackerXPC.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/25/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PivotTrackerXPCProtocol.h"
#import <Foundation/Foundation.h>

@protocol PTTrackerXPCProtocol <NSObject>

- (void)XPCSuccess:(id _Nullable)object;
- (void)XPCFailure:(NSError *_Nullable)error;

@optional
- (BOOL)updateProgress:(double)currentProgress;
- (void)finished;

@end
@interface PTTrackerXPC : NSObject <PivotTrackerXPCReturnProtocol>

@end
