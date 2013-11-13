//
//  LondonTaxiSpecs.m
//  DuchyBotDemo
//
//  Created by Matt Glover on 13/11/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TaxiCab.h"

// Mocks
#import "TaxiCabDriver.h"
#import "TaxiCabPassenger.h"

SPEC_BEGIN(LondonTextCabSpecs)

describe(@"LondonTaxiCab", ^{
    
    context(@" when created", ^{
        
        __block TaxiCab *taxiCab;
        beforeEach(^{
            taxiCab = [[TaxiCab alloc] init];
        });
        
        it(@" should not be nil", ^{
            [[taxiCab shouldNot] beNil];
        });
        
        context(@" with a designated initialiser", ^{
            
            __block TaxiCabDriver *mockDriver;
            __block TaxiCab *taxiCab;
            beforeEach(^{
                mockDriver = [KWMock mockForClass:[TaxiCabDriver class]];
                taxiCab = [[TaxiCab alloc] initWithRegistrationNumber:@"ABC13XYZ" driver:mockDriver];
            });
            
            it(@"should have it's correct Registraton Number", ^{
                [[taxiCab.registrationNumber should] equal:@"ABC13XYZ"];
            });
            
            it(@"should have it's correct Driver", ^{
                [[taxiCab.driver should] equal:mockDriver];
            });
            
            it(@"should not be occupied", ^{
                [[theValue([taxiCab isOccupied]) should] beNo];
            });
        });
    });
    
    context(@" when in service", ^{
    
        __block TaxiCab *taxiCab;
        beforeEach(^{
            TaxiCabDriver *mockDriver = [KWMock mockForClass:[TaxiCabDriver class]];
            taxiCab = [[TaxiCab alloc] initWithRegistrationNumber:@"ABC13XYZ" driver:mockDriver];
        });
        
        context(@" and is not occupied", ^{
            
            it(@" should not be occupied", ^{
                [[theValue([taxiCab isOccupied]) should] beNo];
            });
            
            context(@" and a passenger requests a lift", ^{
                
                it(@" can add the passenger", ^{
                    TaxiCabPassenger *passenger = [KWMock mockForClass:[TaxiCabPassenger class]];
                    [taxiCab addPassenger:passenger];
                    
                    [[theValue([taxiCab countOfPassengers]) should] equal:theValue(1)];
                });
            });
            
            context(@" and a group of passengers requests a lift", ^{
                
                it(@" can add the group of passenger", ^{
                    TaxiCabPassenger *passenger1 = [KWMock mockForClass:[TaxiCabPassenger class]];
                    TaxiCabPassenger *passenger2 = [KWMock mockForClass:[TaxiCabPassenger class]];
                    TaxiCabPassenger *passenger3 = [KWMock mockForClass:[TaxiCabPassenger class]];
                    NSArray *groupOfPassengers = @[passenger1, passenger2, passenger3];
                    [taxiCab addPassengers:groupOfPassengers];
                    
                    [[theValue([taxiCab countOfPassengers]) should] equal:theValue(3)];
                });
            });
        });
        
        context(@" and is occupied", ^{
            
            __block TaxiCabPassenger *passenger;
            beforeEach(^{
                passenger = [KWMock mockForClass:[TaxiCabPassenger class]];
                [taxiCab addPassenger:passenger];
            });
            
            it(@" should be occupied", ^{
                [[theValue([taxiCab isOccupied]) should] beYes];
            });
            
            context(@" and a passenger requests a lift", ^{
                
                it(@" cannot add the passenger", ^{
                    TaxiCabPassenger *passenger = [KWMock mockForClass:[TaxiCabPassenger class]];
                    [taxiCab addPassenger:passenger];
                    
                    [[theValue([taxiCab countOfPassengers]) should] equal:theValue(1)];
                });
            });
            
            context(@" and a group of passengers requests a lift", ^{
                
                it(@" cannot add the group of passenger", ^{
                    TaxiCabPassenger *passenger1 = [KWMock mockForClass:[TaxiCabPassenger class]];
                    TaxiCabPassenger *passenger2 = [KWMock mockForClass:[TaxiCabPassenger class]];
                    TaxiCabPassenger *passenger3 = [KWMock mockForClass:[TaxiCabPassenger class]];
                    NSArray *groupOfPassengers = @[passenger1, passenger2, passenger3];
                    [taxiCab addPassengers:groupOfPassengers];
                    
                    [[theValue([taxiCab countOfPassengers]) should] equal:theValue(1)];
                });
            });
            
        });
        
    });
    
});

SPEC_END