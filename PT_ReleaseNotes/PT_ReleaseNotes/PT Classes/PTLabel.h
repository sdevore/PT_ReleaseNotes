//
//  PTLabel.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTLabel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double labelIdentifier;
@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double projectId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
