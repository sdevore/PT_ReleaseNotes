//
//  PTTrackerXPC.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/25/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//
#import "PTObject.h"
#import "PTTrackerXPC.h"
#import "PivotTrackerXPCProtocol.h"
#import "SCDMutableDictionary.h"

@interface PTTrackerXPC ()
@property(strong, nonnull) SCDMutableDictionary *_requestObjects;

- (nullable NSXPCConnection *)connectionForUUID:(NSString *)uuid;
- (nullable NSXPCConnection *)connectionForObject:(PTObject *)obj;

@end

@implementation PTTrackerXPC

- (instancetype)init {
  self = [super init];
  if (self) {
    __requestObjects = [SCDMutableDictionary new];
  }
  return self;
}

- (NSXPCConnection *)connectionForUUID:uuid {
  NSXPCConnection *connection = [self._requestObjects objectForKey:uuid];
  if (nil == connection) {
    NSXPCInterface *myCookieInterface = [NSXPCInterface
        interfaceWithProtocol:@protocol(PivotTrackerXPCProtocol)];
    connection = [[NSXPCConnection alloc]
        initWithServiceName:@"com.scidsolutions.PivotTrackerXPC"];
    if (nil == self._requestObjects) {
      self._requestObjects = [SCDMutableDictionary new];
    }
    [self._requestObjects setObject:connection forKey:uuid];
    [connection setRemoteObjectInterface:myCookieInterface];

    connection.exportedInterface = [NSXPCInterface
        interfaceWithProtocol:@protocol(PivotTrackerXPCReturnProtocol)];
    connection.exportedObject = self;

    [connection resume];
  }
  return connection;
}

- (NSXPCConnection *)connectionForObject:(PTObject *)obj {
  return [self connectionForUUID:obj.uuid];
}

#pragma mark PivotTrackerXPCReturnProtocol

- (void)updateProgress:(double)currentProgress withUUID:(NSString *)uuid {
  PTObject *obj = [self._requestObjects objectForKey:uuid];
  if (nil != obj && [obj respondsToSelector:@selector(updateProgress:)]) {
    [obj updateProgress:currentProgress];
  }
}

- (void)finished:(NSString *)uuid {
  PTObject *obj = [self._requestObjects objectForKey:uuid];
  if (nil != obj && [obj respondsToSelector:@selector(finished:)]) {
    [obj finished];
  }
}

@end
