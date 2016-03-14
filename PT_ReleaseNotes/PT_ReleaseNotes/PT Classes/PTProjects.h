//
//  PTProjects.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTAccount;

@interface PTProjects : NSObject

@property (nullable, strong) PTAccount *account;

- (nonnull instancetype)initWithAccount:(nonnull PTAccount *)account;

+ (nonnull instancetype)projectsWithAccount:(nonnull PTAccount *)account;


@end
