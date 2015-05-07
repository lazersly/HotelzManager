//
//  AppDelegate.h
//  HotelzManager
//
//  Created by Brandon Roberts on 5/4/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NSManagedObjectContext;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *sharedManagedObjectContext;

@end

