//
//  PTAccount.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PTProjects;


@interface PTAccount : NSObject

@property (nullable, strong) NSString *apiKey;
@property (nullable, strong) NSArray *Projects;

- (nonnull instancetype)initWithApiKey:(nonnull NSString *)apiKey;

+ (nonnull instancetype)accountWithApiKey:(nonnull NSString *)apiKey;


- (void)getProjects:(nullable void (^)(BOOL completed, PTProjects *_Nullable projects))success
            failure:(nullable void (^)(NSError *_Nullable error))failure;
@end
