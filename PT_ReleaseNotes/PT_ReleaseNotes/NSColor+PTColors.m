//
//  NSColor+PTColors.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "NSColor+Crayola.h"
#import "NSColor+PTColors.h"
#import "NSColor+Pantone.h"
@implementation NSColor (PTColors)

+ (instancetype)successColor {
    return [NSColor crayolaDenimBlueColor];
}

+ (instancetype)warnColor {
    return [NSColor crayolaBurntOrangeColor];
}

+ (instancetype)infoColor {
    return [NSColor crayolaCaribbeanGreenColor];
}

+ (instancetype)dangerColor {
    return [NSColor crayolaRadicalRedColor];
}

@end
