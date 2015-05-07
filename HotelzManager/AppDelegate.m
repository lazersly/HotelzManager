//
//  AppDelegate.m
//  HotelzManager
//
//  Created by Brandon Roberts on 5/4/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "ViewController.h"
#import "FromDateViewController.h"
#import "HotelListViewController.h"
#import <CoreData/CoreData.h>
#import "SeedyJSONParser.h"

@interface AppDelegate ()

@property (readwrite, strong, nonatomic) NSManagedObjectContext *sharedManagedObjectContext;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  
  CoreDataStack *coreDataStack = [[CoreDataStack alloc] init];
  self.sharedManagedObjectContext = coreDataStack.managedObjectContext;
  
  [SeedyJSONParser seedDatabaseIfNecessary];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  [self.window makeKeyAndVisible];
  
//  ViewController *rootVC = [[ViewController alloc] init];

//  FromDateViewController *rootVC = [[FromDateViewController alloc] init];
//  UINavigationController *rootNav = [[UINavigationController alloc] init];
  
  HotelListViewController *rootVC = [[HotelListViewController alloc] init];
  
  self.window.rootViewController = rootVC;
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
  [self.sharedManagedObjectContext save:nil];
}

@end
