//
//  PTProject.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTProject.h"
#import "PTTimeZone.h"

NSString *const kPTProjectPublic = @"public";
NSString *const kPTProjectWeekStartDay = @"week_start_day";
NSString *const kPTProjectEnableFollowing = @"enable_following";
NSString *const kPTProjectAtomEnabled = @"atom_enabled";
NSString *const kPTProjectStartTime = @"start_time";
NSString *const kPTProjectNumberOfDoneIterationsToShow =
    @"number_of_done_iterations_to_show";
NSString *const kPTProjectProjectType = @"project_type";
NSString *const kPTProjectUpdatedAt = @"updated_at";
NSString *const kPTProjectHasGoogleDomain = @"has_google_domain";
NSString *const kPTProjectBugsAndChoresAreEstimatable =
    @"bugs_and_chores_are_estimatable";
NSString *const kPTProjectKind = @"kind";
NSString *const kPTProjectVersion = @"version";
NSString *const kPTProjectAutomaticPlanning = @"automatic_planning";
NSString *const kPTProjectName = @"name";
NSString *const kPTProjectId = @"id";
NSString *const kPTProjectPointScale = @"point_scale";
NSString *const kPTProjectProfileContent = @"profile_content";
NSString *const kPTProjectVelocityAveragedOver = @"velocity_averaged_over";
NSString *const kPTProjectIterationLength = @"iteration_length";
NSString *const kPTProjectTimeZone = @"time_zone";
NSString *const kPTProjectAccountId = @"account_id";
NSString *const kPTProjectCurrentIterationNumber = @"current_iteration_number";
NSString *const kPTProjectCreatedAt = @"created_at";
NSString *const kPTProjectInitialVelocity = @"initial_velocity";
NSString *const kPTProjectEnableIncomingEmails = @"enable_incoming_emails";
NSString *const kPTProjectPointScaleIsCustom = @"point_scale_is_custom";
NSString *const kPTProjectEnableTasks = @"enable_tasks";
NSString *const kPTProjectDescription = @"description";
@interface PTProject ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PTProject
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
  return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
  self = [super init];

  // This check serves to make sure that a non-NSDictionary object
  // passed into the model class doesn't break the parsing.
  if (self && [dict isKindOfClass:[NSDictionary class]]) {
    self.publicProperty = [[self objectOrNilForKey:kPTProjectPublic
                                    fromDictionary:dict] boolValue];
    self.weekStartDay =
        [self objectOrNilForKey:kPTProjectWeekStartDay fromDictionary:dict];
    self.enableFollowing = [[self objectOrNilForKey:kPTProjectEnableFollowing
                                     fromDictionary:dict] boolValue];
    self.atomEnabled = [[self objectOrNilForKey:kPTProjectAtomEnabled
                                 fromDictionary:dict] boolValue];
    self.startTime =
        [self objectOrNilForKey:kPTProjectStartTime fromDictionary:dict];
    self.numberOfDoneIterationsToShow =
        [[self objectOrNilForKey:kPTProjectNumberOfDoneIterationsToShow
                  fromDictionary:dict] doubleValue];
    self.projectType =
        [self objectOrNilForKey:kPTProjectProjectType fromDictionary:dict];
    self.updatedAt =
        [self objectOrNilForKey:kPTProjectUpdatedAt fromDictionary:dict];
    self.hasGoogleDomain = [[self objectOrNilForKey:kPTProjectHasGoogleDomain
                                     fromDictionary:dict] boolValue];
    self.bugsAndChoresAreEstimatable =
        [[self objectOrNilForKey:kPTProjectBugsAndChoresAreEstimatable
                  fromDictionary:dict] boolValue];
    self.kind = [self objectOrNilForKey:kPTProjectKind fromDictionary:dict];
    self.version = [[self objectOrNilForKey:kPTProjectVersion
                             fromDictionary:dict] doubleValue];
    self.automaticPlanning =
        [[self objectOrNilForKey:kPTProjectAutomaticPlanning
                  fromDictionary:dict] boolValue];
    self.name = [self objectOrNilForKey:kPTProjectName fromDictionary:dict];
    self.internalBaseClassIdentifier =
        [[self objectOrNilForKey:kPTProjectId fromDictionary:dict] doubleValue];
    self.pointScale =
        [self objectOrNilForKey:kPTProjectPointScale fromDictionary:dict];
    self.profileContent =
        [self objectOrNilForKey:kPTProjectProfileContent fromDictionary:dict];
    self.velocityAveragedOver =
        [[self objectOrNilForKey:kPTProjectVelocityAveragedOver
                  fromDictionary:dict] doubleValue];
    self.iterationLength = [[self objectOrNilForKey:kPTProjectIterationLength
                                     fromDictionary:dict] doubleValue];
    self.timeZone = [PTTimeZone
        modelObjectWithDictionary:[dict objectForKey:kPTProjectTimeZone]];
    self.accountId = [[self objectOrNilForKey:kPTProjectAccountId
                               fromDictionary:dict] doubleValue];
    self.currentIterationNumber =
        [[self objectOrNilForKey:kPTProjectCurrentIterationNumber
                  fromDictionary:dict] doubleValue];
    self.createdAt =
        [self objectOrNilForKey:kPTProjectCreatedAt fromDictionary:dict];
    self.initialVelocity = [[self objectOrNilForKey:kPTProjectInitialVelocity
                                     fromDictionary:dict] doubleValue];
    self.enableIncomingEmails =
        [[self objectOrNilForKey:kPTProjectEnableIncomingEmails
                  fromDictionary:dict] boolValue];
    self.pointScaleIsCustom =
        [[self objectOrNilForKey:kPTProjectPointScaleIsCustom
                  fromDictionary:dict] boolValue];
    self.enableTasks = [[self objectOrNilForKey:kPTProjectEnableTasks
                                 fromDictionary:dict] boolValue];
    self.internalBaseClassDescription =
        [self objectOrNilForKey:kPTProjectDescription fromDictionary:dict];
  }

  return self;
}

- (NSDictionary *)dictionaryRepresentation {
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:[NSNumber numberWithBool:self.publicProperty]
                 forKey:kPTProjectPublic];
  [mutableDict setValue:self.weekStartDay forKey:kPTProjectWeekStartDay];
  [mutableDict setValue:[NSNumber numberWithBool:self.enableFollowing]
                 forKey:kPTProjectEnableFollowing];
  [mutableDict setValue:[NSNumber numberWithBool:self.atomEnabled]
                 forKey:kPTProjectAtomEnabled];
  [mutableDict setValue:self.startTime forKey:kPTProjectStartTime];
  [mutableDict
      setValue:[NSNumber numberWithDouble:self.numberOfDoneIterationsToShow]
        forKey:kPTProjectNumberOfDoneIterationsToShow];
  [mutableDict setValue:self.projectType forKey:kPTProjectProjectType];
  [mutableDict setValue:self.updatedAt forKey:kPTProjectUpdatedAt];
  [mutableDict setValue:[NSNumber numberWithBool:self.hasGoogleDomain]
                 forKey:kPTProjectHasGoogleDomain];
  [mutableDict
      setValue:[NSNumber numberWithBool:self.bugsAndChoresAreEstimatable]
        forKey:kPTProjectBugsAndChoresAreEstimatable];
  [mutableDict setValue:self.kind forKey:kPTProjectKind];
  [mutableDict setValue:[NSNumber numberWithDouble:self.version]
                 forKey:kPTProjectVersion];
  [mutableDict setValue:[NSNumber numberWithBool:self.automaticPlanning]
                 forKey:kPTProjectAutomaticPlanning];
  [mutableDict setValue:self.name forKey:kPTProjectName];
  [mutableDict
      setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier]
        forKey:kPTProjectId];
  [mutableDict setValue:self.pointScale forKey:kPTProjectPointScale];
  [mutableDict setValue:self.profileContent forKey:kPTProjectProfileContent];
  [mutableDict setValue:[NSNumber numberWithDouble:self.velocityAveragedOver]
                 forKey:kPTProjectVelocityAveragedOver];
  [mutableDict setValue:[NSNumber numberWithDouble:self.iterationLength]
                 forKey:kPTProjectIterationLength];
  [mutableDict setValue:[self.timeZone dictionaryRepresentation]
                 forKey:kPTProjectTimeZone];
  [mutableDict setValue:[NSNumber numberWithDouble:self.accountId]
                 forKey:kPTProjectAccountId];
  [mutableDict setValue:[NSNumber numberWithDouble:self.currentIterationNumber]
                 forKey:kPTProjectCurrentIterationNumber];
  [mutableDict setValue:self.createdAt forKey:kPTProjectCreatedAt];
  [mutableDict setValue:[NSNumber numberWithDouble:self.initialVelocity]
                 forKey:kPTProjectInitialVelocity];
  [mutableDict setValue:[NSNumber numberWithBool:self.enableIncomingEmails]
                 forKey:kPTProjectEnableIncomingEmails];
  [mutableDict setValue:[NSNumber numberWithBool:self.pointScaleIsCustom]
                 forKey:kPTProjectPointScaleIsCustom];
  [mutableDict setValue:[NSNumber numberWithBool:self.enableTasks]
                 forKey:kPTProjectEnableTasks];
  [mutableDict setValue:self.internalBaseClassDescription
                 forKey:kPTProjectDescription];

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

  self.publicProperty = [aDecoder decodeBoolForKey:kPTProjectPublic];
  self.weekStartDay = [aDecoder decodeObjectForKey:kPTProjectWeekStartDay];
  self.enableFollowing = [aDecoder decodeBoolForKey:kPTProjectEnableFollowing];
  self.atomEnabled = [aDecoder decodeBoolForKey:kPTProjectAtomEnabled];
  self.startTime = [aDecoder decodeObjectForKey:kPTProjectStartTime];
  self.numberOfDoneIterationsToShow =
      [aDecoder decodeDoubleForKey:kPTProjectNumberOfDoneIterationsToShow];
  self.projectType = [aDecoder decodeObjectForKey:kPTProjectProjectType];
  self.updatedAt = [aDecoder decodeObjectForKey:kPTProjectUpdatedAt];
  self.hasGoogleDomain = [aDecoder decodeBoolForKey:kPTProjectHasGoogleDomain];
  self.bugsAndChoresAreEstimatable =
      [aDecoder decodeBoolForKey:kPTProjectBugsAndChoresAreEstimatable];
  self.kind = [aDecoder decodeObjectForKey:kPTProjectKind];
  self.version = [aDecoder decodeDoubleForKey:kPTProjectVersion];
  self.automaticPlanning =
      [aDecoder decodeBoolForKey:kPTProjectAutomaticPlanning];
  self.name = [aDecoder decodeObjectForKey:kPTProjectName];
  self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kPTProjectId];
  self.pointScale = [aDecoder decodeObjectForKey:kPTProjectPointScale];
  self.profileContent = [aDecoder decodeObjectForKey:kPTProjectProfileContent];
  self.velocityAveragedOver =
      [aDecoder decodeDoubleForKey:kPTProjectVelocityAveragedOver];
  self.iterationLength =
      [aDecoder decodeDoubleForKey:kPTProjectIterationLength];
  self.timeZone = [aDecoder decodeObjectForKey:kPTProjectTimeZone];
  self.accountId = [aDecoder decodeDoubleForKey:kPTProjectAccountId];
  self.currentIterationNumber =
      [aDecoder decodeDoubleForKey:kPTProjectCurrentIterationNumber];
  self.createdAt = [aDecoder decodeObjectForKey:kPTProjectCreatedAt];
  self.initialVelocity =
      [aDecoder decodeDoubleForKey:kPTProjectInitialVelocity];
  self.enableIncomingEmails =
      [aDecoder decodeBoolForKey:kPTProjectEnableIncomingEmails];
  self.pointScaleIsCustom =
      [aDecoder decodeBoolForKey:kPTProjectPointScaleIsCustom];
  self.enableTasks = [aDecoder decodeBoolForKey:kPTProjectEnableTasks];
  self.internalBaseClassDescription =
      [aDecoder decodeObjectForKey:kPTProjectDescription];
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

  [aCoder encodeBool:_publicProperty forKey:kPTProjectPublic];
  [aCoder encodeObject:_weekStartDay forKey:kPTProjectWeekStartDay];
  [aCoder encodeBool:_enableFollowing forKey:kPTProjectEnableFollowing];
  [aCoder encodeBool:_atomEnabled forKey:kPTProjectAtomEnabled];
  [aCoder encodeObject:_startTime forKey:kPTProjectStartTime];
  [aCoder encodeDouble:_numberOfDoneIterationsToShow
                forKey:kPTProjectNumberOfDoneIterationsToShow];
  [aCoder encodeObject:_projectType forKey:kPTProjectProjectType];
  [aCoder encodeObject:_updatedAt forKey:kPTProjectUpdatedAt];
  [aCoder encodeBool:_hasGoogleDomain forKey:kPTProjectHasGoogleDomain];
  [aCoder encodeBool:_bugsAndChoresAreEstimatable
              forKey:kPTProjectBugsAndChoresAreEstimatable];
  [aCoder encodeObject:_kind forKey:kPTProjectKind];
  [aCoder encodeDouble:_version forKey:kPTProjectVersion];
  [aCoder encodeBool:_automaticPlanning forKey:kPTProjectAutomaticPlanning];
  [aCoder encodeObject:_name forKey:kPTProjectName];
  [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kPTProjectId];
  [aCoder encodeObject:_pointScale forKey:kPTProjectPointScale];
  [aCoder encodeObject:_profileContent forKey:kPTProjectProfileContent];
  [aCoder encodeDouble:_velocityAveragedOver
                forKey:kPTProjectVelocityAveragedOver];
  [aCoder encodeDouble:_iterationLength forKey:kPTProjectIterationLength];
  [aCoder encodeObject:_timeZone forKey:kPTProjectTimeZone];
  [aCoder encodeDouble:_accountId forKey:kPTProjectAccountId];
  [aCoder encodeDouble:_currentIterationNumber
                forKey:kPTProjectCurrentIterationNumber];
  [aCoder encodeObject:_createdAt forKey:kPTProjectCreatedAt];
  [aCoder encodeDouble:_initialVelocity forKey:kPTProjectInitialVelocity];
  [aCoder encodeBool:_enableIncomingEmails
              forKey:kPTProjectEnableIncomingEmails];
  [aCoder encodeBool:_pointScaleIsCustom forKey:kPTProjectPointScaleIsCustom];
  [aCoder encodeBool:_enableTasks forKey:kPTProjectEnableTasks];
  [aCoder encodeObject:_internalBaseClassDescription
                forKey:kPTProjectDescription];
}

- (id)copyWithZone:(NSZone *)zone {
  PTProject *copy = [[PTProject alloc] init];

  if (copy) {

    copy.publicProperty = self.publicProperty;
    copy.weekStartDay = [self.weekStartDay copyWithZone:zone];
    copy.enableFollowing = self.enableFollowing;
    copy.atomEnabled = self.atomEnabled;
    copy.startTime = [self.startTime copyWithZone:zone];
    copy.numberOfDoneIterationsToShow = self.numberOfDoneIterationsToShow;
    copy.projectType = [self.projectType copyWithZone:zone];
    copy.updatedAt = [self.updatedAt copyWithZone:zone];
    copy.hasGoogleDomain = self.hasGoogleDomain;
    copy.bugsAndChoresAreEstimatable = self.bugsAndChoresAreEstimatable;
    copy.kind = [self.kind copyWithZone:zone];
    copy.version = self.version;
    copy.automaticPlanning = self.automaticPlanning;
    copy.name = [self.name copyWithZone:zone];
    copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
    copy.pointScale = [self.pointScale copyWithZone:zone];
    copy.profileContent = [self.profileContent copyWithZone:zone];
    copy.velocityAveragedOver = self.velocityAveragedOver;
    copy.iterationLength = self.iterationLength;
    copy.timeZone = [self.timeZone copyWithZone:zone];
    copy.accountId = self.accountId;
    copy.currentIterationNumber = self.currentIterationNumber;
    copy.createdAt = [self.createdAt copyWithZone:zone];
    copy.initialVelocity = self.initialVelocity;
    copy.enableIncomingEmails = self.enableIncomingEmails;
    copy.pointScaleIsCustom = self.pointScaleIsCustom;
    copy.enableTasks = self.enableTasks;
    copy.internalBaseClassDescription =
        [self.internalBaseClassDescription copyWithZone:zone];
  }

  return copy;
}

@end
