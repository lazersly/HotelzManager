//
//  SeedyJSONParser.m
//  HotelzManager
//
//  Created by Brandon Roberts on 5/5/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "SeedyJSONParser.h"

@implementation SeedyJSONParser

+(void)seedDatabaseIfNecessary {
  
  NSURL *url = [[NSBundle mainBundle] URLForResource:@"seed" withExtension:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfURL:url];
  NSDictionary *seedInfo = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
  
//  NSString *seedPath = [[NSBundle mainBundle] pathForResource:@"seed" ofType:@"json"];
//  NSString *encodedJSON = [NSString stringWithContentsOfFile:seedPath encoding:NSUTF8StringEncoding error:nil];
  
  NSLog(@"Seed Info: %@", seedInfo);
}

+(void)parseJSON {
  
}

@end
