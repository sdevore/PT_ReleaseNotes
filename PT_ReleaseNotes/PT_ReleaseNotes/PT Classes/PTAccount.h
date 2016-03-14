//
//  PTAccount.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PTProjects;
@class PTTimeZone;

@interface PTAccount : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nullable, nonatomic, strong) PTTimeZone *timeZone;
@property (nullable, nonatomic, strong) NSArray *projects;
@property (nullable, nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) BOOL receivesInAppNotifications;
@property (nullable, nonatomic, strong) NSString *apiToken;
@property (nullable, nonatomic, strong) NSString *updatedAt;
@property (nullable, nonatomic, strong) NSString *username;
@property (nonatomic, assign) BOOL hasGoogleIdentity;
@property (nullable, nonatomic, strong) NSString *kind;
@property (nullable, nonatomic, strong) NSString *email;
@property (nullable, nonatomic, strong) NSString *initials;
@property (nullable, nonatomic, strong) NSString *name;

+ (nonnull instancetype)modelObjectWithDictionary:(nullable NSDictionary *)dict;
- (nonnull instancetype)initWithDictionary:(nullable NSDictionary *)dict;
- (nullable NSDictionary *)dictionaryRepresentation;

@property (nullable, strong) NSString *apiKey;

- (nonnull instancetype)initWithApiKey:(nonnull NSString *)apiKey;

+ (nonnull instancetype)accountWithApiKey:(nonnull NSString *)apiKey;

- (void)me:(nullable void (^)(BOOL completed, PTProjects *_Nullable projects))success
   failure:(nullable void (^)(NSError *_Nullable error))failure;

- (void)getProjects:(nullable void (^)(BOOL completed, PTProjects *_Nullable projects))success
            failure:(nullable void (^)(NSError *_Nullable error))failure;
@end
