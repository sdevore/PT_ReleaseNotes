//
//  PTEpic.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "PTEpic.h"
#import "PTLabel.h"

NSString *const kPTEpicUpdatedAt = @"updated_at";
NSString *const kPTEpicUrl = @"url";
NSString *const kPTEpicId = @"id";
NSString *const kPTEpicCreatedAt = @"created_at";
NSString *const kPTEpicLabel = @"label";
NSString *const kPTEpicKind = @"kind";
NSString *const kPTEpicDescription = @"description";
NSString *const kPTEpicName = @"name";
NSString *const kPTEpicProjectId = @"project_id";

@interface PTEpic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PTEpic

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
  return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
  self = [super init];

  // This check serves to make sure that a non-NSDictionary object
  // passed into the model class doesn't break the parsing.
  if (self && [dict isKindOfClass:[NSDictionary class]]) {
    self.updatedAt =
        [self objectOrNilForKey:kPTEpicUpdatedAt fromDictionary:dict];
    self.url = [self objectOrNilForKey:kPTEpicUrl fromDictionary:dict];
    self.internalBaseClassIdentifier =
        [[self objectOrNilForKey:kPTEpicId fromDictionary:dict] doubleValue];
    self.createdAt =
        [self objectOrNilForKey:kPTEpicCreatedAt fromDictionary:dict];
    self.label =
        [PTLabel modelObjectWithDictionary:[dict objectForKey:kPTEpicLabel]];
    self.kind = [self objectOrNilForKey:kPTEpicKind fromDictionary:dict];
    self.internalBaseClassDescription =
        [self objectOrNilForKey:kPTEpicDescription fromDictionary:dict];
    self.name = [self objectOrNilForKey:kPTEpicName fromDictionary:dict];
    self.projectId = [[self objectOrNilForKey:kPTEpicProjectId
                               fromDictionary:dict] doubleValue];
  }

  return self;
}

- (NSDictionary *)dictionaryRepresentation {
  NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
  [mutableDict setValue:self.updatedAt forKey:kPTEpicUpdatedAt];
  [mutableDict setValue:self.url forKey:kPTEpicUrl];
  [mutableDict
      setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier]
        forKey:kPTEpicId];
  [mutableDict setValue:self.createdAt forKey:kPTEpicCreatedAt];
  [mutableDict setValue:[self.label dictionaryRepresentation]
                 forKey:kPTEpicLabel];
  [mutableDict setValue:self.kind forKey:kPTEpicKind];
  [mutableDict setValue:self.internalBaseClassDescription
                 forKey:kPTEpicDescription];
  [mutableDict setValue:self.name forKey:kPTEpicName];
  [mutableDict setValue:[NSNumber numberWithDouble:self.projectId]
                 forKey:kPTEpicProjectId];

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

  self.updatedAt = [aDecoder decodeObjectForKey:kPTEpicUpdatedAt];
  self.url = [aDecoder decodeObjectForKey:kPTEpicUrl];
  self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kPTEpicId];
  self.createdAt = [aDecoder decodeObjectForKey:kPTEpicCreatedAt];
  self.label = [aDecoder decodeObjectForKey:kPTEpicLabel];
  self.kind = [aDecoder decodeObjectForKey:kPTEpicKind];
  self.internalBaseClassDescription =
      [aDecoder decodeObjectForKey:kPTEpicDescription];
  self.name = [aDecoder decodeObjectForKey:kPTEpicName];
  self.projectId = [aDecoder decodeDoubleForKey:kPTEpicProjectId];
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {

  [aCoder encodeObject:_updatedAt forKey:kPTEpicUpdatedAt];
  [aCoder encodeObject:_url forKey:kPTEpicUrl];
  [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kPTEpicId];
  [aCoder encodeObject:_createdAt forKey:kPTEpicCreatedAt];
  [aCoder encodeObject:_label forKey:kPTEpicLabel];
  [aCoder encodeObject:_kind forKey:kPTEpicKind];
  [aCoder encodeObject:_internalBaseClassDescription forKey:kPTEpicDescription];
  [aCoder encodeObject:_name forKey:kPTEpicName];
  [aCoder encodeDouble:_projectId forKey:kPTEpicProjectId];
}

- (id)copyWithZone:(NSZone *)zone {
  PTEpic *copy = [[PTEpic alloc] init];

  if (copy) {

    copy.updatedAt = [self.updatedAt copyWithZone:zone];
    copy.url = [self.url copyWithZone:zone];
    copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
    copy.createdAt = [self.createdAt copyWithZone:zone];
    copy.label = [self.label copyWithZone:zone];
    copy.kind = [self.kind copyWithZone:zone];
    copy.internalBaseClassDescription =
        [self.internalBaseClassDescription copyWithZone:zone];
    copy.name = [self.name copyWithZone:zone];
    copy.projectId = self.projectId;
  }

  return copy;
}

@end
