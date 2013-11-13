//
//  TaxiCabDriverSpecs.m
//  DuchyBotDemo
//
//  Created by Matt Glover on 13/11/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "TaxiCabDriver.h"

SPEC_BEGIN(TaxiCabDriverSpecs)

describe(@"TaxiCabDriver", ^{
    
    context(@" when created", ^{
        
        it(@" should not be nil", ^{
            TaxiCabDriver *driver = [[TaxiCabDriver alloc] init];
            [[driver shouldNot] beNil];
        });
        
    });
});

SPEC_END
