//
//  PTProject.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTTimeZone;

@interface PTProject : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL publicProperty;
@property (nonatomic, strong) NSString *weekStartDay;
@property (nonatomic, assign) BOOL enableFollowing;
@property (nonatomic, assign) BOOL atomEnabled;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, assign) double numberOfDoneIterationsToShow;
@property (nonatomic, strong) NSString *projectType;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) BOOL hasGoogleDomain;
@property (nonatomic, assign) BOOL bugsAndChoresAreEstimatable;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, assign) double version;
@property (nonatomic, assign) BOOL automaticPlanning;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *pointScale;
@property (nonatomic, strong) NSString *profileContent;
@property (nonatomic, assign) double velocityAveragedOver;
@property (nonatomic, assign) double iterationLength;
@property (nonatomic, strong) PTTimeZone *timeZone;
@property (nonatomic, assign) double accountId;
@property (nonatomic, assign) double currentIterationNumber;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double initialVelocity;
@property (nonatomic, assign) BOOL enableIncomingEmails;
@property (nonatomic, assign) BOOL pointScaleIsCustom;
@property (nonatomic, assign) BOOL enableTasks;
@property (nonatomic, strong) NSString *internalBaseClassDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
