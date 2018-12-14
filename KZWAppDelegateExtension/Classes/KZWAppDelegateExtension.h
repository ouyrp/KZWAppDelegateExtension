//
//  KZWAppDelegateExtension.h
//  KZWAppDelegateExtension
//
//  Created by yang ou on 2018/12/14.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KZWApplicationDelegate <UIApplicationDelegate, UNUserNotificationCenterDelegate>
@optional
//Called when start loading business configs
- (void)applicationDidStartLoadingBusinessConfig;

@end

@interface KZWAppDelegateExtension : NSObject<UIApplicationDelegate, UNUserNotificationCenterDelegate, KZWApplicationDelegate>

+ (instancetype)sharedInstance;

//初始化所有delegate
- (void)initAllDelegates:(NSArray<NSString *> *)allDelegates;

@end

NS_ASSUME_NONNULL_END
