//
//  CoreDataStack.h
//  HotelzManager
//
//  Created by Brandon Roberts on 5/6/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NSManagedObjectContext;

@interface CoreDataStack : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)saveContext;

@end
