//
//  KZWAppDelegate.m
//  KZWAppDelegateExtension
//
//  Created by ouyrp on 12/14/2018.
//  Copyright (c) 2018 ouyrp. All rights reserved.
//

#import "KZWAppDelegate.h"
#import  <KZWAppDelegateExtension/KZWAppDelegateExtension.h>

@implementation KZWAppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *allDelegates = [[NSArray alloc] initWithObjects:@"KZWAppDelegateLogin", nil];
    [[KZWAppDelegateExtension sharedInstance] initAllDelegates:allDelegates];
    [[KZWAppDelegateExtension sharedInstance] application:application willFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[KZWAppDelegateExtension sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [[KZWAppDelegateExtension sharedInstance] applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[KZWAppDelegateExtension sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[KZWAppDelegateExtension sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[KZWAppDelegateExtension sharedInstance] applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[KZWAppDelegateExtension sharedInstance] applicationWillTerminate:application];
}

#pragma mark - Handling Remote Notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[KZWAppDelegateExtension sharedInstance] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[KZWAppDelegateExtension sharedInstance] application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [[KZWAppDelegateExtension sharedInstance] application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

// Deprecated from iOS 10.0
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[KZWAppDelegateExtension sharedInstance] application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(nonnull void (^)())completionHandler {
    [[KZWAppDelegateExtension sharedInstance] application:application
                                 handleActionWithIdentifier:identifier
                                      forRemoteNotification:userInfo
                                          completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(nonnull void (^)())completionHandler {
    [[KZWAppDelegateExtension sharedInstance] application:application
                                 handleActionWithIdentifier:identifier
                                      forRemoteNotification:userInfo
                                           withResponseInfo:responseInfo completionHandler:completionHandler];
}

#pragma mark - Handling Local Notification

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    [[KZWAppDelegateExtension sharedInstance] userNotificationCenter:center willPresentNotification:notification withCompletionHandler:completionHandler];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
    [[KZWAppDelegateExtension sharedInstance] userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
}

// Deprecated from iOS 10.0
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [[KZWAppDelegateExtension sharedInstance] application:application didReceiveLocalNotification:notification];
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
  completionHandler:(nonnull void (^)())completionHandler {
    [[KZWAppDelegateExtension sharedInstance] application:application handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
   withResponseInfo:(NSDictionary *)responseInfo
  completionHandler:(nonnull void (^)())completionHandler {
    [[KZWAppDelegateExtension sharedInstance] application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [[KZWAppDelegateExtension sharedInstance] application:application didRegisterUserNotificationSettings:notificationSettings];
}

#pragma mark - Handling Continuing User Activity and Handling Quick Actions

- (BOOL)application:(UIApplication *)application
willContinueUserActivityWithType:(NSString *)userActivityType {
    return [[KZWAppDelegateExtension sharedInstance] application:application
                                  willContinueUserActivityWithType:userActivityType];
}

- (BOOL)application:(UIApplication *)application
continueUserActivity:(NSUserActivity *)userActivity
 restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler {
    return [[KZWAppDelegateExtension sharedInstance] application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
}

- (void)application:(UIApplication *)application
didUpdateUserActivity:(NSUserActivity *)userActivity {
    [[KZWAppDelegateExtension sharedInstance] application:application didUpdateUserActivity:userActivity];
}

- (void)application:(UIApplication *)application
didFailToContinueUserActivityWithType:(NSString *)userActivityType
              error:(NSError *)error {
    [[KZWAppDelegateExtension sharedInstance] application:application didFailToContinueUserActivityWithType:userActivityType error:error];
}

- (void)application:(UIApplication *)application
performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
  completionHandler:(void (^)(BOOL succeeded))completionHandler {
    [[KZWAppDelegateExtension sharedInstance] application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    return [[KZWAppDelegateExtension sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [[KZWAppDelegateExtension sharedInstance] application:application openURL:url options:options];
}

@end
