//
//  PTPerson.m
//
//  Created by   on 3/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PTPerson.h"


NSString *const kPTPersonEmail = @"email";
NSString *const kPTPersonId = @"id";
NSString *const kPTPersonKind = @"kind";
NSString *const kPTPersonInitials = @"initials";
NSString *const kPTPersonName = @"name";
NSString *const kPTPersonUsername = @"username";


@interface PTPerson ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PTPerson

@synthesize email = _email;
@synthesize personIdentifier = _personIdentifier;
@synthesize kind = _kind;
@synthesize initials = _initials;
@synthesize name = _name;
@synthesize username = _username;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.email = [self objectOrNilForKey:kPTPersonEmail fromDictionary:dict];
            self.personIdentifier = [[self objectOrNilForKey:kPTPersonId fromDictionary:dict] doubleValue];
            self.kind = [self objectOrNilForKey:kPTPersonKind fromDictionary:dict];
            self.initials = [self objectOrNilForKey:kPTPersonInitials fromDictionary:dict];
            self.name = [self objectOrNilForKey:kPTPersonName fromDictionary:dict];
            self.username = [self objectOrNilForKey:kPTPersonUsername fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.email forKey:kPTPersonEmail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.personIdentifier] forKey:kPTPersonId];
    [mutableDict setValue:self.kind forKey:kPTPersonKind];
    [mutableDict setValue:self.initials forKey:kPTPersonInitials];
    [mutableDict setValue:self.name forKey:kPTPersonName];
    [mutableDict setValue:self.username forKey:kPTPersonUsername];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.email = [aDecoder decodeObjectForKey:kPTPersonEmail];
    self.personIdentifier = [aDecoder decodeDoubleForKey:kPTPersonId];
    self.kind = [aDecoder decodeObjectForKey:kPTPersonKind];
    self.initials = [aDecoder decodeObjectForKey:kPTPersonInitials];
    self.name = [aDecoder decodeObjectForKey:kPTPersonName];
    self.username = [aDecoder decodeObjectForKey:kPTPersonUsername];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_email forKey:kPTPersonEmail];
    [aCoder encodeDouble:_personIdentifier forKey:kPTPersonId];
    [aCoder encodeObject:_kind forKey:kPTPersonKind];
    [aCoder encodeObject:_initials forKey:kPTPersonInitials];
    [aCoder encodeObject:_name forKey:kPTPersonName];
    [aCoder encodeObject:_username forKey:kPTPersonUsername];
}

- (id)copyWithZone:(NSZone *)zone
{
    PTPerson *copy = [[PTPerson alloc] init];
    
    if (copy) {

        copy.email = [self.email copyWithZone:zone];
        copy.personIdentifier = self.personIdentifier;
        copy.kind = [self.kind copyWithZone:zone];
        copy.initials = [self.initials copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
    }
    
    return copy;
}


@end
