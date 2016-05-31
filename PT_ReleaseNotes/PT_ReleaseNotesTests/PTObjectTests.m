//
//  PTObjectTests.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/25/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//
#import "PTAccount.h"
#import "PTObject.h"
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>
@interface PTObjectTests : XCTestCase

@end

@implementation PTObjectTests

- (void)setUp {
  [super setUp];
  // Put setup code here. This method is called before the invocation of each
  // test method in the class.
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each
  // test method in the class.
  [super tearDown];
}

- (void)testUUIDNotNil {
  PTObject *obj1 = [PTObject new];
  assertThat(obj1, notNilValue());
  assertThat(obj1.uuid, notNilValue());
}

- (void)testBaseObjectHasValidUUID {
  PTObject *obj1 = [PTObject new];

  assertThat(obj1, isA([PTObject class]));
  assertThat(obj1.uuid, notNilValue());
  assertThat(obj1.uuid, containsSubstring(@"-"));
}

- (void)testAccountIsPTOboject {
  PTAccount *account = [PTAccount new];
  assertThat(account, instanceOf([PTObject class]));
  assertThat(account.uuid, notNilValue());
  assertThat(account.uuid, containsSubstring(@"-"));
}

- (void)testObjectConforms {
  PTAccount *account = [PTAccount new];
  assertThat(account, conformsTo(@protocol(PTTrackerXPCProtocol)));
}

- (void)testPerformanceExample {
  // This is an example of a performance test case.
  [self measureBlock:^{
    // Put the code you want to measure the time of here.
    PTObject *obj1 = [PTObject new];
  }];
}

@end
