//
//  PivotTrackerXPC.m
//  PivotTrackerXPC
//
//  Created by Samuel DeVore on 5/4/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PivotTrackerXPC.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
// Log levels: off, error, warn, info, verbose
#import "XCDLumberjackNSLogger.h"

@interface PivotTrackerXPC ()
@property (atomic, strong, readonly) NSXPCListener *listener;
@end
@implementation PivotTrackerXPC

- (instancetype)init {
    self = [super init];
    if (self) {
        self->_listener = [NSXPCListener serviceListener];
        assert(self->_listener != nil); // this code must be run from an XPC service

        self->_listener.delegate = self;
    }
    return self;
}

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
    [newConnection setExportedInterface:[NSXPCInterface interfaceWithProtocol:@protocol(PivotTrackerXPCProtocol)]];
    [newConnection setExportedObject:self];
    self.xpcConnection = newConnection;

    newConnection.remoteObjectInterface =
        [NSXPCInterface interfaceWithProtocol:@protocol(PivotTrackerXPCReturnProtocol)];

    // connections start suspended by default, so resume and start receiving them
    [newConnection resume];

    return YES;
}

- (void)doProcessing:(NSString *)name withReply:(void (^)(NSString *g))reply {
    NSLog(@"object: %@", self);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int index = 0; index < 60; ++index) {
            double rnd = (rand() % 10) / 20;
            [NSThread sleepForTimeInterval:rnd];
            [[self.xpcConnection remoteObjectProxy] updateProgress:(double)index / (double)60 * 100 withName:name];
        }

        [[self.xpcConnection remoteObjectProxy] finished:name];
    });

    // nil is a valid return value.
    reply([NSString stringWithFormat:@"%@ This is a reply!", name]);
}


// This implements the example protocol. Replace the body of this class with the implementation of this service's
// protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
