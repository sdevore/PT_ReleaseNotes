//
//  PTPerson.h
//
//  Created by   on 3/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PTPerson : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) double personIdentifier;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *initials;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
