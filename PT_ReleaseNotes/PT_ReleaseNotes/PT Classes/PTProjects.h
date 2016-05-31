//
//  PTProjects.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTObject.h"
#import <Foundation/Foundation.h>
@class PTAccount;
@class PTProjects;

typedef void (^PTProjectsSuccess)(BOOL complete,
                                  PTProjects *_Nullable projects);

@interface PTProjects : PTObject

@property(nullable, strong) PTAccount *account;

- (nonnull instancetype)initWithAccount:(nonnull PTAccount *)account;

+ (nonnull instancetype)projectsWithAccount:(nonnull PTAccount *)account;

@end
