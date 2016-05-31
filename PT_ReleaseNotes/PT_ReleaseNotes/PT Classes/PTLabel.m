//
//  PTLabel.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTLabel.h"

NSString *const kPTLabelCreatedAt = @"created_at";
NSString *const kPTLabelId = @"id";
NSString *const kPTLabelKind = @"kind";
NSString *const kPTLabelUpdatedAt = @"updated_at";
NSString *const kPTLabelName = @"name";
NSString *const kPTLabelProjectId = @"project_id";

@interface PTLabel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PTLabel

@synthesize createdAt = _createdAt;
@synthesize labelIdentifier = _labelIdentifier;
@synthesize kind = _kind;
@synthesize updatedAt = _updatedAt;
@synthesize name = _name;
@synthesize projectId = _projectId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
  return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
  self = [super init];

  // This check serves to make sure that a non-NSDictionary object
  // passed into the model class doesn't break the parsing.
  if (self && [dict isKindOfClass:[NSDictionary class]]) {
    self.createdAt =
        [self objectOrNilForKey:kPTLabelCreatedAt fromDictionary:dict];
    self.labelIdentifier =
        [[self objectOrNilForKey:kPTLabelId fromDictionary:dict] doubleValue];
    self.kind = [self objectOrNilForKey:kPTLabelKind fromDictionary:dict];
    self.updatedAt =
        [self objectOrNilForKey:kPTLabelUpdatedAt fromDictionary:dict];
    self.name = [self objectOrNilForKey:kPTLabelName fromDictionary:dict];
    self.projectId = [[self objectOrNilForKey:kPTLabelProjectId
                               fromDictionary:dict] doubleValue];
  }

  return self;
}

- (NSDictionary *)dictionaryRepresentation {
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self.createdAt forKey:kPTLabelCreatedAt];
  [mutableDict setValue:[NSNumber numberWithDouble:self.labelIdentifier]
                 forKey:kPTLabelId];
  [mutableDict setValue:self.kind forKey:kPTLabelKind];
  [mutableDict setValue:self.updatedAt forKey:kPTLabelUpdatedAt];
  [mutableDict setValue:self.name forKey:kPTLabelName];
  [mutableDict setValue:[NSNumber numberWithDouble:self.projectId]
                 forKey:kPTLabelProjectId];

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

  self.createdAt = [aDecoder decodeObjectForKey:kPTLabelCreatedAt];
  self.labelIdentifier = [aDecoder decodeDoubleForKey:kPTLabelId];
  self.kind = [aDecoder decodeObjectForKey:kPTLabelKind];
  self.updatedAt = [aDecoder decodeObjectForKey:kPTLabelUpdatedAt];
  self.name = [aDecoder decodeObjectForKey:kPTLabelName];
  self.projectId = [aDecoder decodeDoubleForKey:kPTLabelProjectId];
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:_createdAt forKey:kPTLabelCreatedAt];
  [aCoder encodeDouble:_labelIdentifier forKey:kPTLabelId];
  [aCoder encodeObject:_kind forKey:kPTLabelKind];
  [aCoder encodeObject:_updatedAt forKey:kPTLabelUpdatedAt];
  [aCoder encodeObject:_name forKey:kPTLabelName];
  [aCoder encodeDouble:_projectId forKey:kPTLabelProjectId];
}

- (id)copyWithZone:(NSZone *)zone {
  PTLabel *copy = [[PTLabel alloc] init];

  if (copy) {
    copy.createdAt = [self.createdAt copyWithZone:zone];
    copy.labelIdentifier = self.labelIdentifier;
    copy.kind = [self.kind copyWithZone:zone];
    copy.updatedAt = [self.updatedAt copyWithZone:zone];
    copy.name = [self.name copyWithZone:zone];
    copy.projectId = self.projectId;
  }

  return copy;
}

@end
