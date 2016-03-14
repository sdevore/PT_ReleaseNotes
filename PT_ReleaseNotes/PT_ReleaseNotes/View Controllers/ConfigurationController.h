//
//  ConfigurationController.h
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PTAccount;

@interface ConfigurationController : NSViewController

@property (nullable, strong) PTAccount  *account;
@property (weak) IBOutlet NSButton *LoadButton;
@property (weak) IBOutlet NSPopUpButton *ProjectsPopUpButton;


- (IBAction)projectsPopUpButton:(nullable id)sender;
- (IBAction)loadButton:(nullable id)sender;
@end
