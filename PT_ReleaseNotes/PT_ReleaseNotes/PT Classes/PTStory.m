//
//  PTStory.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTStory.h"

NSString *const kPTStoryId = @"id";
NSString *const kPTStoryDescription = @"description";
NSString *const kPTStoryCreatedAt = @"created_at";
NSString *const kPTStoryLabels = @"labels";
NSString *const kPTStoryAcceptedAt = @"accepted_at";
NSString *const kPTStoryEstimate = @"estimate";
NSString *const kPTStoryUrl = @"url";
NSString *const kPTStoryCurrentState = @"current_state";
NSString *const kPTStoryOwnedById = @"owned_by_id";
NSString *const kPTStoryStoryType = @"story_type";
NSString *const kPTStoryRequestedById = @"requested_by_id";
NSString *const kPTStoryUpdatedAt = @"updated_at";
NSString *const kPTStoryProjectId = @"project_id";
NSString *const kPTStoryKind = @"kind";
NSString *const kPTStoryOwnerIds = @"owner_ids";
NSString *const kPTStoryName = @"name";
NSString *const kPTStoryDeadline = @"deadline";

@interface PTStory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PTStory

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize internalBaseClassDescription = _internalBaseClassDescription;
@synthesize createdAt = _createdAt;
@synthesize labels = _labels;
@synthesize acceptedAt = _acceptedAt;
@synthesize estimate = _estimate;
@synthesize url = _url;
@synthesize currentState = _currentState;
@synthesize ownedById = _ownedById;
@synthesize storyType = _storyType;
@synthesize requestedById = _requestedById;
@synthesize updatedAt = _updatedAt;
@synthesize projectId = _projectId;
@synthesize kind = _kind;
@synthesize ownerIds = _ownerIds;
@synthesize name = _name;
@synthesize deadline = _deadline;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
  return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
  self = [super init];

  // This check serves to make sure that a non-NSDictionary object
  // passed into the model class doesn't break the parsing.
  if (self && [dict isKindOfClass:[NSDictionary class]]) {
    self.internalBaseClassIdentifier =
        [[self objectOrNilForKey:kPTStoryId fromDictionary:dict] doubleValue];
    self.internalBaseClassDescription =
        [self objectOrNilForKey:kPTStoryDescription fromDictionary:dict];
    self.createdAt =
        [self objectOrNilForKey:kPTStoryCreatedAt fromDictionary:dict];
    self.labels = [self objectOrNilForKey:kPTStoryLabels fromDictionary:dict];
    self.acceptedAt =
        [self objectOrNilForKey:kPTStoryAcceptedAt fromDictionary:dict];
    self.estimate = [[self objectOrNilForKey:kPTStoryEstimate
                              fromDictionary:dict] doubleValue];
    self.url = [self objectOrNilForKey:kPTStoryUrl fromDictionary:dict];
    self.currentState =
        [self objectOrNilForKey:kPTStoryCurrentState fromDictionary:dict];
    self.ownedById = [[self objectOrNilForKey:kPTStoryOwnedById
                               fromDictionary:dict] doubleValue];
    self.storyType =
        [self objectOrNilForKey:kPTStoryStoryType fromDictionary:dict];
    self.requestedById = [[self objectOrNilForKey:kPTStoryRequestedById
                                   fromDictionary:dict] doubleValue];
    self.updatedAt =
        [self objectOrNilForKey:kPTStoryUpdatedAt fromDictionary:dict];
    self.projectId = [[self objectOrNilForKey:kPTStoryProjectId
                               fromDictionary:dict] doubleValue];
    self.kind = [self objectOrNilForKey:kPTStoryKind fromDictionary:dict];
    self.ownerIds =
        [self objectOrNilForKey:kPTStoryOwnerIds fromDictionary:dict];
    self.name = [self objectOrNilForKey:kPTStoryName fromDictionary:dict];
    self.deadline =
        [self objectOrNilForKey:kPTStoryDeadline fromDictionary:dict];
  }

  return self;
}

- (NSDictionary *)dictionaryRepresentation {
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict
      setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier]
        forKey:kPTStoryId];
  [mutableDict setValue:self.internalBaseClassDescription
                 forKey:kPTStoryDescription];
  [mutableDict setValue:self.createdAt forKey:kPTStoryCreatedAt];
  NSMutableArray *tempArrayForLabels = [NSMutableArray array];
  for (NSObject *subArrayObject in self.labels) {
    if ([subArrayObject
            respondsToSelector:@selector(dictionaryRepresentation)]) {
      // This class is a model object
      [tempArrayForLabels
          addObject:[subArrayObject
                        performSelector:@selector(dictionaryRepresentation)]];
    } else {
      // Generic object
      [tempArrayForLabels addObject:subArrayObject];
    }
  }
  [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLabels]
                 forKey:kPTStoryLabels];
  [mutableDict setValue:self.acceptedAt forKey:kPTStoryAcceptedAt];
  [mutableDict setValue:[NSNumber numberWithDouble:self.estimate]
                 forKey:kPTStoryEstimate];
  [mutableDict setValue:self.url forKey:kPTStoryUrl];
  [mutableDict setValue:self.currentState forKey:kPTStoryCurrentState];
  [mutableDict setValue:[NSNumber numberWithDouble:self.ownedById]
                 forKey:kPTStoryOwnedById];
  [mutableDict setValue:self.storyType forKey:kPTStoryStoryType];
  [mutableDict setValue:[NSNumber numberWithDouble:self.requestedById]
                 forKey:kPTStoryRequestedById];
  [mutableDict setValue:self.updatedAt forKey:kPTStoryUpdatedAt];
  [mutableDict setValue:[NSNumber numberWithDouble:self.projectId]
                 forKey:kPTStoryProjectId];
  [mutableDict setValue:self.kind forKey:kPTStoryKind];
  NSMutableArray *tempArrayForOwnerIds = [NSMutableArray array];
  for (NSObject *subArrayObject in self.ownerIds) {
    if ([subArrayObject
            respondsToSelector:@selector(dictionaryRepresentation)]) {
      // This class is a model object
      [tempArrayForOwnerIds
          addObject:[subArrayObject
                        performSelector:@selector(dictionaryRepresentation)]];
    } else {
      // Generic object
      [tempArrayForOwnerIds addObject:subArrayObject];
    }
  }
  [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOwnerIds]
                 forKey:kPTStoryOwnerIds];
  [mutableDict setValue:self.name forKey:kPTStoryName];
  [mutableDict setValue:self.deadline forKey:kPTStoryDeadline];

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

  self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kPTStoryId];
  self.internalBaseClassDescription =
      [aDecoder decodeObjectForKey:kPTStoryDescription];
  self.createdAt = [aDecoder decodeObjectForKey:kPTStoryCreatedAt];
  self.labels = [aDecoder decodeObjectForKey:kPTStoryLabels];
  self.acceptedAt = [aDecoder decodeObjectForKey:kPTStoryAcceptedAt];
  self.estimate = [aDecoder decodeDoubleForKey:kPTStoryEstimate];
  self.url = [aDecoder decodeObjectForKey:kPTStoryUrl];
  self.currentState = [aDecoder decodeObjectForKey:kPTStoryCurrentState];
  self.ownedById = [aDecoder decodeDoubleForKey:kPTStoryOwnedById];
  self.storyType = [aDecoder decodeObjectForKey:kPTStoryStoryType];
  self.requestedById = [aDecoder decodeDoubleForKey:kPTStoryRequestedById];
  self.updatedAt = [aDecoder decodeObjectForKey:kPTStoryUpdatedAt];
  self.projectId = [aDecoder decodeDoubleForKey:kPTStoryProjectId];
  self.kind = [aDecoder decodeObjectForKey:kPTStoryKind];
  self.ownerIds = [aDecoder decodeObjectForKey:kPTStoryOwnerIds];
  self.name = [aDecoder decodeObjectForKey:kPTStoryName];
  self.deadline = [aDecoder decodeObjectForKey:kPTStoryDeadline];
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kPTStoryId];
  [aCoder encodeObject:_internalBaseClassDescription
                forKey:kPTStoryDescription];
  [aCoder encodeObject:_createdAt forKey:kPTStoryCreatedAt];
  [aCoder encodeObject:_labels forKey:kPTStoryLabels];
  [aCoder encodeObject:_acceptedAt forKey:kPTStoryAcceptedAt];
  [aCoder encodeDouble:_estimate forKey:kPTStoryEstimate];
  [aCoder encodeObject:_url forKey:kPTStoryUrl];
  [aCoder encodeObject:_currentState forKey:kPTStoryCurrentState];
  [aCoder encodeDouble:_ownedById forKey:kPTStoryOwnedById];
  [aCoder encodeObject:_storyType forKey:kPTStoryStoryType];
  [aCoder encodeDouble:_requestedById forKey:kPTStoryRequestedById];
  [aCoder encodeObject:_updatedAt forKey:kPTStoryUpdatedAt];
  [aCoder encodeDouble:_projectId forKey:kPTStoryProjectId];
  [aCoder encodeObject:_kind forKey:kPTStoryKind];
  [aCoder encodeObject:_ownerIds forKey:kPTStoryOwnerIds];
  [aCoder encodeObject:_name forKey:kPTStoryName];
  [aCoder encodeObject:_deadline forKey:kPTStoryDeadline];
}

- (id)copyWithZone:(NSZone *)zone {
  PTStory *copy = [[PTStory alloc] init];

  if (copy) {
    copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
    copy.internalBaseClassDescription =
        [self.internalBaseClassDescription copyWithZone:zone];
    copy.createdAt = [self.createdAt copyWithZone:zone];
    copy.labels = [self.labels copyWithZone:zone];
    copy.acceptedAt = [self.acceptedAt copyWithZone:zone];
    copy.estimate = self.estimate;
    copy.url = [self.url copyWithZone:zone];
    copy.currentState = [self.currentState copyWithZone:zone];
    copy.ownedById = self.ownedById;
    copy.storyType = [self.storyType copyWithZone:zone];
    copy.requestedById = self.requestedById;
    copy.updatedAt = [self.updatedAt copyWithZone:zone];
    copy.projectId = self.projectId;
    copy.kind = [self.kind copyWithZone:zone];
    copy.ownerIds = [self.ownerIds copyWithZone:zone];
    copy.name = [self.name copyWithZone:zone];
    copy.deadline = [self.deadline copyWithZone:zone];
  }

  return copy;
}

@end
