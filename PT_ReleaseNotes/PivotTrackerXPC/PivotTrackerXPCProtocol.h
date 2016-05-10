//
//  PivotTrackerXPCProtocol.h
//  PivotTrackerXPC
//
//  Created by Samuel DeVore on 5/4/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//  http://stackoverflow.com/questions/21623565/how-to-send-a-message-from-xpc-helper-app-to-main-application/22172070#22172070
//

#import <Foundation/Foundation.h>

// The protocol that this service will vend as its API. This header file will also need to be visible to the process
// hosting the service.
@protocol PivotTrackerXPCProtocol

// Replace the API of this protocol with an API appropriate to the service you are vending.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply;
- (void)doProcessing:(NSString *)name withReply:(void (^)(NSString *response))reply;
@end

@protocol PivotTrackerXPCReturnProtocol

- (void)updateProgress:(double)currentProgress withName:(NSString *)name;
- (void)finished:(NSString *)name;

@end

/*
 To use the service from an application or other process, use NSXPCConnection to establish a connection to the service
by doing something like this:

     _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"com.scidsolutions.PivotTrackerXPC"];
     _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(StringModifing)];
     [_connectionToService resume];

Once you have a connection to the service, you can use it like this:

     [[_connectionToService remoteObjectProxy] upperCaseString:@"hello" withReply:^(NSString *aString) {
         // We have received a response. Update our text field, but do it on the main thread.
         NSLog(@"Result string was: %@", aString);
     }];

 And, when you are finished with the service, clean up the connection like this:

     [_connectionToService invalidate];
*/
