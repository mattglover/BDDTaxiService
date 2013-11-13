//
//  TaxiCab.h
//  DuchyBotDemo
//
//  Created by Matt Glover on 13/11/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TaxiCabDriver;
@class TaxiCabPassenger;
@interface TaxiCab : NSObject

@property (nonatomic, copy,   readonly) NSString *registrationNumber;
@property (nonatomic, strong, readonly) TaxiCabDriver *driver;
@property (nonatomic, assign, readonly) BOOL isOccupied;

- (id)initWithRegistrationNumber:(NSString *)registrationNumber driver:(TaxiCabDriver *)driver;

- (void)addPassenger:(TaxiCabPassenger *)passenger;
- (void)addPassengers:(NSArray *)passengers;
- (NSUInteger)countOfPassengers;

@end
