//
//  PTStory.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTStory : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *internalBaseClassDescription;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSArray *labels;
@property (nonatomic, strong) NSString *acceptedAt;
@property (nonatomic, assign) double estimate;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *currentState;
@property (nonatomic, assign) double ownedById;
@property (nonatomic, strong) NSString *storyType;
@property (nonatomic, assign) double requestedById;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) double projectId;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSArray *ownerIds;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *deadline;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
