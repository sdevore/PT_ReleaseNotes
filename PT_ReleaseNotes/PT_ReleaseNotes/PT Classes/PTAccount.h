//
//  PTAccount.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTObject.h"
#import "PTProjects.h"
#import "PTTimeZone.h"
#import <Foundation/Foundation.h>
@class PTAccount;

typedef void (^PTAccountSuccess)(BOOL complete, PTAccount *_Nullable account);

typedef void (^PTAccountFailure)(NSError *_Nullable error);

@interface PTAccount : PTObject <NSCoding, NSCopying>

@property(nonatomic, assign) double internalBaseClassIdentifier;
@property(nullable, nonatomic, strong) PTTimeZone *timeZone;
@property(nullable, nonatomic, strong) NSArray *projects;
@property(nullable, nonatomic, strong) NSString *createdAt;
@property(nonatomic, assign) BOOL receivesInAppNotifications;
@property(nullable, nonatomic, strong) NSString *apiToken;
@property(nullable, nonatomic, strong) NSString *updatedAt;
@property(nullable, nonatomic, strong) NSString *username;
@property(nonatomic, assign) BOOL hasGoogleIdentity;
@property(nullable, nonatomic, strong) NSString *kind;
@property(nullable, nonatomic, strong) NSString *email;
@property(nullable, nonatomic, strong) NSString *initials;
@property(nullable, nonatomic, strong) NSString *name;

@property(nullable, strong) NSString *apiKey;
@property(nonatomic, copy, nullable) PTAccountSuccess success;
@property(nonatomic, copy, nullable) PTAccountFailure failure;

+ (nonnull instancetype)modelObjectWithDictionary:(nullable NSDictionary *)dict;
- (nonnull instancetype)initWithDictionary:(nullable NSDictionary *)dict;
- (nullable NSDictionary *)dictionaryRepresentation;

- (nonnull instancetype)initWithApiKey:(nonnull NSString *)apiKey;

+ (nonnull instancetype)accountWithApiKey:(nonnull NSString *)apiKey;

- (void)me:(nullable PTAccountSuccess)success
   failure:(nullable PTAccountFailure)failure;

- (void)getProjects:(nullable PTProjectsSuccess)success
            failure:(nullable PTAccountFailure)failure;

@end
