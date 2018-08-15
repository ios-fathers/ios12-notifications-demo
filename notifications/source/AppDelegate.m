//
//  AppDelegate.m
//  notifications
//
//  Copyright © 2018 iOS Fathers. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>
@end

@implementation AppDelegate

#pragma mark - UIApplicationDelegate

-(BOOL) application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    return YES;
}

#pragma mark - UNUserNotificationCenterDelegate

-(void) userNotificationCenter:(UNUserNotificationCenter*)center willPresentNotification:(UNNotification*)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    NSLog(@"willPresentNotification: %@", notification);
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:notification.request.content.title message:notification.request.content.body preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil]];
    [self.window.rootViewController presentViewController:alertController animated:YES completion:^{
        
    }];
    
    completionHandler(UNNotificationPresentationOptionAlert);
}

-(void) userNotificationCenter:(UNUserNotificationCenter*)center didReceiveNotificationResponse:(UNNotificationResponse*)response withCompletionHandler:(void(^)(void))completionHandler
{
    NSLog(@"didReceiveNotificationResponse: %@", response);
    completionHandler();
}

-(void) userNotificationCenter:(UNUserNotificationCenter*)center openSettingsForNotification:(UNNotification*)notification
{
    NSLog(@"openSettingsForNotification: %@", notification);
    
    UIViewController* settingsController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self.window.rootViewController presentViewController:settingsController animated:YES completion:nil];
}

@end
