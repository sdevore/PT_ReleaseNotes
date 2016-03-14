//
//  PTProjects.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTProjects.h"

@implementation PTProjects
- (instancetype)initWithAccount:(PTAccount *)account {
 self = [super init];
 if (self) {
  self.account = account;
 }

 return self;
}

+ (instancetype)projectsWithAccount:(PTAccount *)account {
 return [[self alloc] initWithAccount:account];
}


@end
