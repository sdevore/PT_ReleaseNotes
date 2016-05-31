//
//  PTObject.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/25/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTObject.h"

@implementation PTObject
- (instancetype)init {
  self = [super init];
  if (self) {
    _uuid = [[NSUUID UUID] UUIDString];
  }
  return self;
}
@end
