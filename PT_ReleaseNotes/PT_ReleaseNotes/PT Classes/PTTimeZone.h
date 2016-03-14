//
//  PTTimeZone.h
//
//  Created by   on 3/13/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PTTimeZone : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *olsonName;
@property (nonatomic, strong) NSString *offset;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
