//
//  TaxiCab.m
//  DuchyBotDemo
//
//  Created by Matt Glover on 13/11/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import "TaxiCab.h"
#import "TaxiCabDriver.h"

@interface TaxiCab ()
@property (nonatomic, strong) NSMutableArray *passengers;
@end

@implementation TaxiCab

- (id)init {
    return [self initWithRegistrationNumber:@"" driver:nil];
}

- (id)initWithRegistrationNumber:(NSString *)registrationNumber driver:(TaxiCabDriver *)driver {
    
    self = [super init];
    if (self) {
        _registrationNumber = registrationNumber;
        _driver = driver;
        
        _passengers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Passengers
- (void)addPassengers:(NSArray *)passengers {
    if (![self isOccupied]) {
        for (id passenger in passengers) {
            [_passengers addObject:passenger];
        }
    }
}

- (void)addPassenger:(TaxiCabPassenger *)passenger {
    if (![self isOccupied]) {
        [_passengers addObject:passenger];
        _isOccupied = YES;
    }
}

- (NSUInteger)countOfPassengers {
    return [_passengers count];
}

@end
