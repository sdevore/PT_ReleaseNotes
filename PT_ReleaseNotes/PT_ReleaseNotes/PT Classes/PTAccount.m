//
//  PTAccount.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "AFNetworking.h"
#import "AppDelegate.h"
#import "PTAccount.h"
#import "PTClasses.h"
NSString *const kPTAccountId = @"id";
NSString *const kPTAccountTimeZone = @"time_zone";
NSString *const kPTAccountProjects = @"projects";
NSString *const kPTAccountCreatedAt = @"created_at";
NSString *const kPTAccountReceivesInAppNotifications = @"receives_in_app_notifications";
NSString *const kPTAccountApiToken = @"api_token";
NSString *const kPTAccountUpdatedAt = @"updated_at";
NSString *const kPTAccountUsername = @"username";
NSString *const kPTAccountHasGoogleIdentity = @"has_google_identity";
NSString *const kPTAccountKind = @"kind";
NSString *const kPTAccountEmail = @"email";
NSString *const kPTAccountInitials = @"initials";
NSString *const kPTAccountName = @"name";


@interface PTAccount ()

- (nonnull NSURL *)baseURL;
- (nonnull AFHTTPSessionManager *)manager;
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

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

- (NSURL *)baseURL {
    NSURL *baseURL = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/"];
    [baseURL URLByAppendingPathComponent:self.apiKey];
    return baseURL;
}

- (AFHTTPSessionManager *)manager {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:self.baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:self.apiKey forHTTPHeaderField:@"X-TrackerToken"];
    return manager;
}

- (void)me:(void (^)(BOOL, PTProjects *_Nullable))success failure:(void (^)(NSError *_Nullable))failure {
    AFHTTPSessionManager *manager = [self manager];
    __weak typeof(self)weakSelf = self;
    [manager GET:@"me"
        parameters:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
            PTAccount *me = [PTAccount modelObjectWithDictionary:responseObject];
            weakSelf.name = me.name;
            weakSelf.email = me.email;
            weakSelf.initials = me.initials;
            weakSelf.username = me.username;
            weakSelf.projects = me.projects;
            weakSelf.timeZone = me.timeZone;
            DDLogVerbose(@"%@", me);
            if (nil != success) {
                success(YES, nil);
            }
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            if (nil != failure) {
                failure(error);
            }
        }];
}

- (void)getProjects:(void (^)(BOOL, PTProjects *_Nullable))success failure:(void (^)(NSError *_Nullable))failure {
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];

    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.internalBaseClassIdentifier = [[self objectOrNilForKey:kPTAccountId fromDictionary:dict] doubleValue];
        self.timeZone = [PTTimeZone modelObjectWithDictionary:[dict objectForKey:kPTAccountTimeZone]];
        NSObject *receivedPTProjects = [dict objectForKey:kPTAccountProjects];
        NSMutableArray *parsedPTProjects = [NSMutableArray array];
        if ([receivedPTProjects isKindOfClass:[NSArray class]]) {
            for (NSDictionary *item in (NSArray *)receivedPTProjects) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [parsedPTProjects addObject:[PTProject modelObjectWithDictionary:item]];
                }
            }
        } else if ([receivedPTProjects isKindOfClass:[NSDictionary class]]) {
            [parsedPTProjects addObject:[PTProject modelObjectWithDictionary:(NSDictionary *)receivedPTProjects]];
        }

        self.projects = [NSArray arrayWithArray:parsedPTProjects];
        self.createdAt = [self objectOrNilForKey:kPTAccountCreatedAt fromDictionary:dict];
        self.receivesInAppNotifications =
            [[self objectOrNilForKey:kPTAccountReceivesInAppNotifications fromDictionary:dict] boolValue];
        self.apiToken = [self objectOrNilForKey:kPTAccountApiToken fromDictionary:dict];
        self.updatedAt = [self objectOrNilForKey:kPTAccountUpdatedAt fromDictionary:dict];
        self.username = [self objectOrNilForKey:kPTAccountUsername fromDictionary:dict];
        self.hasGoogleIdentity = [[self objectOrNilForKey:kPTAccountHasGoogleIdentity fromDictionary:dict] boolValue];
        self.kind = [self objectOrNilForKey:kPTAccountKind fromDictionary:dict];
        self.email = [self objectOrNilForKey:kPTAccountEmail fromDictionary:dict];
        self.initials = [self objectOrNilForKey:kPTAccountInitials fromDictionary:dict];
        self.name = [self objectOrNilForKey:kPTAccountName fromDictionary:dict];
    }

    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kPTAccountId];
    [mutableDict setValue:[self.timeZone dictionaryRepresentation] forKey:kPTAccountTimeZone];
    NSMutableArray *tempArrayForProjects = [NSMutableArray array];
    for (NSObject *subArrayObject in self.projects) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProjects addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProjects addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProjects] forKey:kPTAccountProjects];
    [mutableDict setValue:self.createdAt forKey:kPTAccountCreatedAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.receivesInAppNotifications]
                   forKey:kPTAccountReceivesInAppNotifications];
    [mutableDict setValue:self.apiToken forKey:kPTAccountApiToken];
    [mutableDict setValue:self.updatedAt forKey:kPTAccountUpdatedAt];
    [mutableDict setValue:self.username forKey:kPTAccountUsername];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasGoogleIdentity] forKey:kPTAccountHasGoogleIdentity];
    [mutableDict setValue:self.kind forKey:kPTAccountKind];
    [mutableDict setValue:self.email forKey:kPTAccountEmail];
    [mutableDict setValue:self.initials forKey:kPTAccountInitials];
    [mutableDict setValue:self.name forKey:kPTAccountName];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kPTAccountId];
    self.timeZone = [aDecoder decodeObjectForKey:kPTAccountTimeZone];
    self.projects = [aDecoder decodeObjectForKey:kPTAccountProjects];
    self.createdAt = [aDecoder decodeObjectForKey:kPTAccountCreatedAt];
    self.receivesInAppNotifications = [aDecoder decodeBoolForKey:kPTAccountReceivesInAppNotifications];
    self.apiToken = [aDecoder decodeObjectForKey:kPTAccountApiToken];
    self.updatedAt = [aDecoder decodeObjectForKey:kPTAccountUpdatedAt];
    self.username = [aDecoder decodeObjectForKey:kPTAccountUsername];
    self.hasGoogleIdentity = [aDecoder decodeBoolForKey:kPTAccountHasGoogleIdentity];
    self.kind = [aDecoder decodeObjectForKey:kPTAccountKind];
    self.email = [aDecoder decodeObjectForKey:kPTAccountEmail];
    self.initials = [aDecoder decodeObjectForKey:kPTAccountInitials];
    self.name = [aDecoder decodeObjectForKey:kPTAccountName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kPTAccountId];
    [aCoder encodeObject:_timeZone forKey:kPTAccountTimeZone];
    [aCoder encodeObject:_projects forKey:kPTAccountProjects];
    [aCoder encodeObject:_createdAt forKey:kPTAccountCreatedAt];
    [aCoder encodeBool:_receivesInAppNotifications forKey:kPTAccountReceivesInAppNotifications];
    [aCoder encodeObject:_apiToken forKey:kPTAccountApiToken];
    [aCoder encodeObject:_updatedAt forKey:kPTAccountUpdatedAt];
    [aCoder encodeObject:_username forKey:kPTAccountUsername];
    [aCoder encodeBool:_hasGoogleIdentity forKey:kPTAccountHasGoogleIdentity];
    [aCoder encodeObject:_kind forKey:kPTAccountKind];
    [aCoder encodeObject:_email forKey:kPTAccountEmail];
    [aCoder encodeObject:_initials forKey:kPTAccountInitials];
    [aCoder encodeObject:_name forKey:kPTAccountName];
}

- (id)copyWithZone:(NSZone *)zone {
    PTAccount *copy = [[PTAccount alloc] init];

    if (copy) {
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.timeZone = [self.timeZone copyWithZone:zone];
        copy.projects = [self.projects copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.receivesInAppNotifications = self.receivesInAppNotifications;
        copy.apiToken = [self.apiToken copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.hasGoogleIdentity = self.hasGoogleIdentity;
        copy.kind = [self.kind copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.initials = [self.initials copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }

    return copy;
}

@end
