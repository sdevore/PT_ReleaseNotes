//
//  PTAccount.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "AFNetworking.h"
#import "PTAccount.h"
#import "PTClasses.h"

@implementation PTAccount
- (instancetype)initWithApiKey:(NSString *)apiKey {
    self = [super init];
    if (self) {
        self.apiKey = apiKey;
    }

    return self;
}

+ (instancetype)accountWithApiKey:(NSString *)apiKey {
    return [[self alloc] initWithApiKey:apiKey];
}


-(void)getProjects:(void (^)(BOOL, PTProjects * _Nullable))success failure:(void (^)(NSError * _Nullable))failure {
    
}

@end
