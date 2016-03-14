//
//  ConfigurationController.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "ConfigurationController.h"
#import "PTClasses.h"
@interface ConfigurationController ()

@end

@implementation ConfigurationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)projectsPopUpButton:(id)sender {
}

- (IBAction)loadButton:(id)sender {
    NSUserDefaults *dc = [NSUserDefaults standardUserDefaults];
    NSString *apiKey = [dc stringForKey:kAPIKey];
    if (nil != apiKey) {
        self.account = [PTAccount accountWithApiKey:apiKey];
        [self.account me:^(BOOL completed, PTProjects *_Nullable projects) {
            DDLogVerbose(@"projects: %@", projects);
        }
            failure:^(NSError *_Nullable error) {
                [[NSAlert alertWithError:error] runModal];
            }];
        [self.account getProjects:^(BOOL completed, PTProjects *_Nullable projects) {
            DDLogVerbose(@"projects: %@", projects);
        }
            failure:^(NSError *_Nullable error) {
                DDLogError(@"problem loading projects: %@", error);
            }];
    } else {
        NSAlert *alert = [NSAlert new];
        alert.messageText = NSLocalizedString(@"No API Key set", @"no api key message text");
        alert.informativeText = NSLocalizedString(@"Unless you set a valid API Key, you will not be able to load "
                                                  @"projects.  If you do not have an API Key you can get one.",
                                                  @"");
        [alert addButtonWithTitle:@"OK"];
        [alert addButtonWithTitle:@"Get Key"];
        NSModalResponse response = [alert runModal];
        if (NSAlertFirstButtonReturn == response) {
            return;
        } else if (NSAlertSecondButtonReturn == response) {
            [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"https://www.pivotaltracker.com/profile"]];
        }
    }
}
@end
