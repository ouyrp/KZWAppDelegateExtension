//
//  KZWAppDelegateDecorate.m
//  KZWAppDelegateDecorate
//
//  Created by yang ou on 2018/11/22.
//

#import "KZWAppDelegateExtension.h"

@interface KZWAppDelegateExtension ()

@property (nonatomic, strong) NSMutableArray<id<KZWApplicationDelegate>> *delegates;

@end

@implementation KZWAppDelegateExtension

+ (instancetype)sharedInstance {
    static KZWAppDelegateExtension *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (NSMutableArray<id<KZWApplicationDelegate>> *)delegates {
    if (!_delegates) {
        _delegates = [NSMutableArray array];
    }
    return _delegates;
}

- (void)addDelegate:(id<KZWApplicationDelegate>) delegate {
    if (delegate && ![self.delegates containsObject:delegate]) {
        [self.delegates addObject:delegate];
    }
}

- (void)initAllDelegates:(NSArray<NSString *> *)allDelegates {
    for (NSString *delegateName in allDelegates) {
        id<KZWApplicationDelegate> delegate = [[NSClassFromString(delegateName) alloc] init];
        [self addDelegate:delegate];
    }
}

#pragma mark - State Transitions / Launch time:

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application willFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

#pragma mark - State Transitions / Transitioning to the foreground:

- (void)applicationDidBecomeActive:(UIApplication *)application {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate applicationDidBecomeActive:application];
        }
    }
}

#pragma mark - State Transitions / Transitioning to the foreground:

- (void)applicationDidEnterBackground:(UIApplication *)application {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate applicationDidEnterBackground:application];
        }
    }
}

#pragma mark - State Transitions / Transitioning to the inactive state:

// Called when leaving the foreground state.
- (void)applicationWillResignActive:(UIApplication *)application {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate applicationWillResignActive:application];
        }
    }
}

// Called when transitioning out of the background state.
- (void)applicationWillEnterForeground:(UIApplication *)application {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate applicationWillEnterForeground:application];
        }
    }
}

#pragma mark - State Transitions / Termination:

- (void)applicationWillTerminate:(UIApplication *)application {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate applicationWillTerminate:application];
        }
    }
}

#pragma mark - Handling Remote Notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}

// Deprecated from iOS 10.0
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forRemoteNotification:(NSDictionary *)userInfo
  completionHandler:(void (^)(void))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application
       handleActionWithIdentifier:identifier
            forRemoteNotification:userInfo
                completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forRemoteNotification:(NSDictionary *)userInfo
   withResponseInfo:(NSDictionary *)responseInfo
  completionHandler:(void (^)(void))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application
       handleActionWithIdentifier:identifier
            forRemoteNotification:userInfo
                 withResponseInfo:responseInfo
                completionHandler:completionHandler];
        }
    }
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    BOOL result = NO;
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            result = result || [delegate application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    BOOL result = NO;
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            result = result || [delegate application:application openURL:url options:options];
        }
    }
    return result;
}

#pragma mark - Handling Local Notification

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate userNotificationCenter:center
                     willPresentNotification:notification
                       withCompletionHandler:completionHandler];
        }
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate userNotificationCenter:center
              didReceiveNotificationResponse:response
                       withCompletionHandler:completionHandler];
        }
    }
}

// Deprecated from iOS 10.0
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didReceiveLocalNotification:notification];
        }
    }
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
  completionHandler:(void (^)(void))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application
       handleActionWithIdentifier:identifier
             forLocalNotification:notification
                completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
   withResponseInfo:(NSDictionary *)responseInfo
  completionHandler:(void (^)(void))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application
       handleActionWithIdentifier:identifier
             forLocalNotification:notification
                 withResponseInfo:responseInfo
                completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didRegisterUserNotificationSettings:notificationSettings];
        }
    }
}

#pragma mark - Handling Continuing User Activity and Handling Quick Actions

- (BOOL)application:(UIApplication *)application
willContinueUserActivityWithType:(NSString *)userActivityType {
    BOOL result = NO;
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            result = result || [delegate application:application willContinueUserActivityWithType:userActivityType];
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application
continueUserActivity:(NSUserActivity *)userActivity
 restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler {
    BOOL result = NO;
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            result = result || [delegate application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
        }
    }
    return result;
}

- (void)application:(UIApplication *)application
didUpdateUserActivity:(NSUserActivity *)userActivity {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didUpdateUserActivity:userActivity];
        }
    }
}

- (void)application:(UIApplication *)application
didFailToContinueUserActivityWithType:(NSString *)userActivityType
              error:(NSError *)error {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application didFailToContinueUserActivityWithType:userActivityType error:error];
        }
    }
}

- (void)application:(UIApplication *)application
performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
  completionHandler:(void (^)(BOOL succeeded))completionHandler {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
        }
    }
}

#pragma mark - Handling KZW Custom Actions

//Called when start loading business configs
- (void)applicationDidStartLoadingBusinessConfig {
    for (id<KZWApplicationDelegate> delegate in self.delegates) {
        if ([delegate respondsToSelector:_cmd]) {
            [delegate applicationDidStartLoadingBusinessConfig];
        }
    }
}

@end
