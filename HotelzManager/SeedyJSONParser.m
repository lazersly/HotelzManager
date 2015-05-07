//
//  SeedyJSONParser.m
//  HotelzManager
//
//  Created by Brandon Roberts on 5/5/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "SeedyJSONParser.h"
#import "CoreDataStack.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Hotel.h"
#import "Room.h"

@implementation SeedyJSONParser

+(NSManagedObjectContext *)managedObjectContext {
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  return appDelegate.sharedManagedObjectContext;
}

+(void)seedDatabaseIfNecessary {
  
  if (![SeedyJSONParser necessaryToSeedDB]) {
    return;
  }
  
  NSURL *url = [[NSBundle mainBundle] URLForResource:@"seed" withExtension:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfURL:url];
  NSDictionary *seedInfo = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
  
  [self parseJSON:seedInfo];
  
  NSLog(@"Seed Info: %@", seedInfo);
  
  NSFetchRequest *requestAll = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  NSArray *allHotels = [[SeedyJSONParser managedObjectContext] executeFetchRequest:requestAll error:nil];
  NSLog(@"%@", allHotels);
}


+(BOOL)necessaryToSeedDB {
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  NSError *fetchError;
  NSArray *result = [[SeedyJSONParser managedObjectContext] executeFetchRequest:request error:&fetchError];
  if (fetchError) {
    // An error occurred
    NSLog(@"Error: %@", fetchError.localizedDescription);
    return YES;
  }
  
  if (result.count == 0 || !result) {
    return YES;
  }
  
  return NO;
}

+(void)parseJSON:(NSDictionary *)json {
  NSManagedObjectContext *context = [SeedyJSONParser managedObjectContext];
  NSArray *hotels = json[@"Hotels"];
  
  for (NSDictionary *hotelInfo in hotels) {
    Hotel *currentHotel = [NSEntityDescription insertNewObjectForEntityForName:@"Hotel" inManagedObjectContext:context];
    currentHotel.name = hotelInfo[@"name"];
    currentHotel.location = hotelInfo[@"location"];
    currentHotel.stars = hotelInfo[@"stars"];
    
    NSArray *rooms = hotelInfo[@"rooms"];
    for (NSDictionary *roomInfo in rooms) {
      Room *newRoom = [NSEntityDescription insertNewObjectForEntityForName:@"Room" inManagedObjectContext:context];
      newRoom.number = roomInfo[@"number"];
      newRoom.beds = roomInfo[@"beds"];
      newRoom.rate = roomInfo[@"rate"];
      newRoom.hotel = currentHotel;
    }
  }
  
  NSError *saveError;
  [context save:&saveError];
  
  if (saveError) {
    NSLog(@"Save Error: %@", saveError.localizedDescription);

  }
}

@end
