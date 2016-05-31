//
//  PTObject.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/25/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTTrackerXPC.h"
#import <Foundation/Foundation.h>

@interface PTObject : NSObject <PTTrackerXPCProtocol>

@property(nonnull, strong) NSString *uuid;

@end
