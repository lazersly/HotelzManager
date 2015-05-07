//
//  Reservation.h
//  HotelzManager
//
//  Created by Brandon Roberts on 5/6/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest, Room;

@interface Reservation : NSManagedObject

@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSDate * endDate;
@property (nonatomic, retain) Guest *guest;
@property (nonatomic, retain) Room *room;

@end
