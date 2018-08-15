//
//  ViewController.m
//  notifications
//
//  Copyright © 2018 iOS Fathers. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Actions

-(IBAction) requestPermission:(id)sender
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionProvidesAppNotificationSettings completionHandler:^(BOOL granted, NSError *error) {
        NSLog(@"UNUserNotificationCenter authorization granted=%@, error=%@", @(granted), error);
    }];
}

-(IBAction) requestQuietPermission:(id)sender
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:UNAuthorizationOptionProvisional | UNAuthorizationOptionProvidesAppNotificationSettings completionHandler:^(BOOL granted, NSError *error) {
        NSLog(@"UNUserNotificationCenter provisional authorization granted=%@, error=%@", @(granted), error);
    }];
}

-(IBAction) scheduleNotification1:(id)sender
{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"iOS Fathers";
    content.body = @"Test notification with thread 1";
    content.threadIdentifier = @"thread1";
    
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3.0 repeats:NO];
    
    NSString* requestId = [NSUUID UUID].UUIDString;
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:requestId content:content trigger:trigger];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError *error) {
        NSLog(@"Notification request error: %@", error);
    }];
}

-(IBAction) scheduleNotification2:(id)sender
{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"iOS Fathers";
    content.body = @"Test notification with thread 2";
    content.threadIdentifier = @"thread2";
    
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3.0 repeats:NO];
    
    NSString* requestId = [NSUUID UUID].UUIDString;
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:requestId content:content trigger:trigger];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError *error) {
        NSLog(@"Notification request error: %@", error);
    }];
}

@end
