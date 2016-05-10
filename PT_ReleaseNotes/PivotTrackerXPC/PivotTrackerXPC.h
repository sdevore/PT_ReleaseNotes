//
//  PivotTrackerXPC.h
//  PivotTrackerXPC
//
//  Created by Samuel DeVore on 5/4/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PivotTrackerXPCProtocol.h"
#import <Cocoa/Cocoa.h>


// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is
// 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface PivotTrackerXPC : NSObject <NSXPCListenerDelegate, PivotTrackerXPCProtocol>

@property (weak) NSXPCConnection *xpcConnection;

@end
