//
//  ConfigurationController.m
//  PT_ReleaseNotes
//
//  Created by Samuel DeVore on 3/13/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "ConfigurationController.h"
#import "PTAccount.h"
#import "PTProjects.h"
#import "PivotTrackerXPCProtocol.h"

@interface ConfigurationController ()
@property(atomic, strong, readwrite) NSXPCConnection *connection;
@property(atomic, strong) NSMutableDictionary *connections;
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
    [self.account me:^(BOOL complete, PTAccount *_Nullable account) {
      DDLogVerbose(@"account: %@", account);
      [self.account
          getProjects:^(BOOL completed, PTProjects *_Nullable projects) {
            DDLogVerbose(@"projects: %@", projects);
          }
          failure:^(NSError *_Nullable error) {
            DDLogError(@"problem loading projects: %@", error);
          }];

    }
        failure:^(NSError *_Nullable error) {
          [[NSAlert alertWithError:error] runModal];
        }];
  } else {
    NSAlert *alert = [NSAlert new];
    alert.messageText =
        NSLocalizedString(@"No API Key set", @"no api key message text");
    alert.informativeText = NSLocalizedString(
        @"Unless you set a valid API Key, you will not be able to load "
        @"projects.  If you do not have an API Key you can get one.",
        @"");
    [alert addButtonWithTitle:@"OK"];
    [alert addButtonWithTitle:@"Get Key"];
    NSModalResponse response = [alert runModal];
    if (NSAlertFirstButtonReturn == response) {
      return;
    } else if (NSAlertSecondButtonReturn == response) {
      [[NSWorkspace sharedWorkspace]
          openURL:[NSURL
                      URLWithString:@"https://www.pivotaltracker.com/profile"]];
    }
  }
}

- (IBAction)remoteTest:(id)sender {
  [self executeRemoteProcess:@"one"];
  [self executeRemoteProcess:@"two"];
  [self executeRemoteProcess:@"three"];
  [self executeRemoteProcess:@"four"];
}

- (void)executeRemoteProcess:(NSString *)name {
  // Create our connection
  NSXPCInterface *myCookieInterface =
      [NSXPCInterface interfaceWithProtocol:@protocol(PivotTrackerXPCProtocol)];
  NSXPCConnection *connection = [[NSXPCConnection alloc]
      initWithServiceName:@"com.scidsolutions.PivotTrackerXPC"];
  if (nil == self.connections) {
    self.connections = [NSMutableDictionary new];
  }
  [self.connections setObject:connection forKey:name];
  [connection setRemoteObjectInterface:myCookieInterface];

  connection.exportedInterface = [NSXPCInterface
      interfaceWithProtocol:@protocol(PivotTrackerXPCReturnProtocol)];
  connection.exportedObject = self;

  [connection resume];

  id<PivotTrackerXPCProtocol> theProcessor =
      [connection remoteObjectProxyWithErrorHandler:^(NSError *err) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:err.localizedDescription];
        [alert setAlertStyle:NSWarningAlertStyle];

        [alert performSelectorOnMainThread:@selector(runModal)
                                withObject:nil
                             waitUntilDone:YES];
      }];

  [theProcessor doProcessing:name
                   withReply:^(NSString *response) {
                     DDLogInfo(@"Received response: %@", response);
                   }];
}

#pragma mark -
#pragma mark Progress

- (void)updateProgress:(double)currentProgress withName:(NSString *)name {
  DDLogInfo(@"%@ In progress: %f", name, currentProgress);
}

- (void)finished:(NSString *)name {
  DDLogInfo(@"%@ Has finished!", name);
  if (nil != self.connection) {
    [self.connections removeObjectForKey:name];
  }
}

@end
