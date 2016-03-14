//
//  PTTimeZone.m
//
//  Created by   on 3/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PTTimeZone.h"


NSString *const kPTTimeZoneKind = @"kind";
NSString *const kPTTimeZoneOlsonName = @"olson_name";
NSString *const kPTTimeZoneOffset = @"offset";


@interface PTTimeZone ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PTTimeZone

@synthesize kind = _kind;
@synthesize olsonName = _olsonName;
@synthesize offset = _offset;


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
            self.kind = [self objectOrNilForKey:kPTTimeZoneKind fromDictionary:dict];
            self.olsonName = [self objectOrNilForKey:kPTTimeZoneOlsonName fromDictionary:dict];
            self.offset = [self objectOrNilForKey:kPTTimeZoneOffset fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.kind forKey:kPTTimeZoneKind];
    [mutableDict setValue:self.olsonName forKey:kPTTimeZoneOlsonName];
    [mutableDict setValue:self.offset forKey:kPTTimeZoneOffset];

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

    self.kind = [aDecoder decodeObjectForKey:kPTTimeZoneKind];
    self.olsonName = [aDecoder decodeObjectForKey:kPTTimeZoneOlsonName];
    self.offset = [aDecoder decodeObjectForKey:kPTTimeZoneOffset];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_kind forKey:kPTTimeZoneKind];
    [aCoder encodeObject:_olsonName forKey:kPTTimeZoneOlsonName];
    [aCoder encodeObject:_offset forKey:kPTTimeZoneOffset];
}

- (id)copyWithZone:(NSZone *)zone
{
    PTTimeZone *copy = [[PTTimeZone alloc] init];
    
    if (copy) {

        copy.kind = [self.kind copyWithZone:zone];
        copy.olsonName = [self.olsonName copyWithZone:zone];
        copy.offset = [self.offset copyWithZone:zone];
    }
    
    return copy;
}


@end
