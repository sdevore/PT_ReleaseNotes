//
//  SCDURLQueryMatcher.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/23/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <OCHamcrest/OCHamcrest.h>

@interface SCDURLQueryMatcher : HCDiagnosingMatcher
- (instancetype)initWithName:(NSString *)name
                valueMatcher:(id<HCMatcher>)valueMatcher;
@end

FOUNDATION_EXPORT id hasQuery(NSString *name, id valueMatcher);