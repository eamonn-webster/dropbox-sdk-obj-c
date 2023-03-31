//
//  AppDelegate.m
//  DBRoulette
//
//  Copyright © 2016 Dropbox. All rights reserved.
//

#import <ObjectiveDropboxOfficial/ObjectiveDropboxOfficial.h>

#import "AppDelegate.h"
#import "PhotoViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSString *appKey = @"0tci5zf7xbap0a1";
  NSString *registeredUrlToHandle = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleURLTypes"][0][@"CFBundleURLSchemes"][0];
  if (!appKey || [registeredUrlToHandle containsString:@"<"]) {
    NSString *message = @"You need to set `appKey` variable in `AppDelegate.m`, as well as add to `Info.plist`, before you can use DBRoulette.";
    NSLog(@"%@", message);
    NSLog(@"Terminating...");
    exit(1);
  }
  [DBClientsManager setupWithAppKey:appKey];
  return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary *)options{
    DBOAuthCompletion completion = ^(DBOAuthResult *authResult) {
      if (authResult != nil) {
        if ([authResult isSuccess]) {
          NSLog(@"Success! User is logged into Dropbox.");
          UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
          ViewController *viewController = (ViewController *)navigationController.childViewControllers[0];
          viewController.authSuccessful = YES;
        } else if ([authResult isCancel]) {
          NSLog(@"\n\nAuthorization flow was manually canceled by user!\n\n");
        } else if ([authResult isError]) {
          NSLog(@"\n\nError: %@\n\n", authResult);
        }
      }
    };
    BOOL canHandle = [DBClientsManager handleRedirectURL:url completion:completion];
    return canHandle;
}
@end
