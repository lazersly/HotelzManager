//
//  HotelService.m
//  HotelzManager
//
//  Created by Brandon Roberts on 5/6/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "HotelService.h"
#import "CoreDataStack.h"
#import "AppDelegate.h"

@interface HotelService ()

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation HotelService

-(instancetype)init {
  
  AppDelegate *delegate = [UIApplication sharedApplication].delegate;
  
  if (self == [self initWithManagedObjectContext:delegate.sharedManagedObjectContext]) {
    
  }
  return self;
}

-(instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context {
  if (self == [super init]) {
    _context = context;
  }
  return self;
}

@end
