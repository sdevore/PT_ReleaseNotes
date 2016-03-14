//
//  NSColor+PTColors.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (PTColors)

+ (instancetype)successColor;
+ (instancetype)warnColor;
+ (instancetype)infoColor;
+ (instancetype)dangerColor;
@end
