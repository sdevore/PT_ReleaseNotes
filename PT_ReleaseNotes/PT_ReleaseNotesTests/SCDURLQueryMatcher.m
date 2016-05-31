//
//  SCDURLQueryMatcher.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 5/23/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "SCDURLQueryMatcher.h"
@interface SCDURLQueryMatcher ()
@property(nonatomic, copy, readonly) NSString *name;
@property(nonatomic, readonly) id<HCMatcher> valueMatcher;
@end

@implementation SCDURLQueryMatcher
- (instancetype)initWithName:(NSString *)name
                valueMatcher:(id<HCMatcher>)valueMatcher {
  self = [super init];
  if (self) {
    _name = [name copy];
    _valueMatcher = valueMatcher;
  }
  return self;
}

- (BOOL)matches:(id)item
    describingMismatchTo:(id<HCDescription>)mismatchDescription {
  if (![item isKindOfClass:[NSURL class]])
    return NO;

  NSURLComponents *urlComponents =
      [NSURLComponents componentsWithURL:item resolvingAgainstBaseURL:NO];
  NSArray<NSURLQueryItem *> *queryItems = urlComponents.queryItems;
  for (NSURLQueryItem *queryItem in queryItems)
    if ([queryItem.name isEqualToString:self.name]) {
      if ([self.valueMatcher matches:queryItem.value])
        return YES;
      [[[[[mismatchDescription appendDescriptionOf:self.name]
          appendText:@" had value "] appendDescriptionOf:queryItem.value]
          appendText:@" in "] appendText:urlComponents.query];
      return NO;
    }

  [[[[mismatchDescription appendText:@"no "] appendDescriptionOf:self.name]
      appendText:@" name in "] appendText:urlComponents.query];
  return NO;
}

- (void)describeTo:(id<HCDescription>)description {
  [[[[description appendText:@"a URL with "] appendDescriptionOf:self.name]
      appendText:@" = "] appendDescriptionOf:self.valueMatcher];
}

@end

id hasQuery(NSString *name, id valueMatcher) {
  HCRequireNonNilObject(name);
  HCRequireNonNilObject(valueMatcher);
  return
      [[SCDURLQueryMatcher alloc] initWithName:name
                                  valueMatcher:HCWrapInMatcher(valueMatcher)];
}