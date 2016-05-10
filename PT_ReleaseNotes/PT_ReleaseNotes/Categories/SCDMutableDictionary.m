//
//  SCDMutableDictionary.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/10/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "SCDMutableDictionary.h"

@implementation SCDMutableDictionary {
    dispatch_queue_t _isolationQueue;
    NSMutableDictionary *_storage;
}

/**
 Private common init steps
 */
- (instancetype)initCommon {
    self = [super init];
    if (self) {
        _isolationQueue =
            dispatch_queue_create([@"SCDMutableDictionary Isolation Queue" UTF8String], DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (instancetype)init {
    self = [self initCommon];
    if (self) {
        _storage = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self = [self initCommon];
    if (self) {
        _storage = [NSMutableDictionary dictionaryWithCapacity:numItems];
    }
    return self;
}

- (NSDictionary *)initWithContentsOfFile:(NSString *)path {
    self = [self initCommon];
    if (self) {
        _storage = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self initCommon];
    if (self) {
        _storage = [[NSMutableDictionary alloc] initWithCoder:aDecoder];
    }
    return self;
}

- (instancetype)initWithObjects:(const id[])objects forKeys:(const id<NSCopying>[])keys count:(NSUInteger)cnt {
    self = [self initCommon];
    if (self) {
        if (!objects || !keys) {
            [NSException raise:NSInvalidArgumentException format:@"objects and keys cannot be nil"];
        } else {
            for (NSUInteger i = 0; i < cnt; ++i) {
                _storage[keys[i]] = objects[i];
            }
        }
    }
    return self;
}

- (NSUInteger)count {
    __block NSUInteger count;
    dispatch_sync(_isolationQueue, ^{
        count = _storage.count;
    });
    return count;
}

- (id)objectForKey:(id)aKey {
    __block id obj;
    dispatch_sync(_isolationQueue, ^{
        obj = _storage[aKey];
    });
    return obj;
}

- (NSEnumerator *)keyEnumerator {
    __block NSEnumerator *enu;
    dispatch_sync(_isolationQueue, ^{
        enu = [_storage keyEnumerator];
    });
    return enu;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    aKey = [aKey copyWithZone:NULL];
    dispatch_barrier_async(_isolationQueue, ^{
        _storage[aKey] = anObject;
    });
}

- (void)removeObjectForKey:(id)aKey {
    dispatch_barrier_async(_isolationQueue, ^{
        [_storage removeObjectForKey:aKey];
    });
}

@end
