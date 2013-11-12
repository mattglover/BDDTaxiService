//
//  DuchyBotDemoSpecs.m
//  DuchyBotDemo
//
//  Created by Matt Glover on 12/11/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#include <Kiwi/Kiwi.h>

SPEC_BEGIN(DuchyBotDemoString)

describe(@"DuchyBotDemoString", ^{
    
    context(@"when created", ^{
        
        it(@"should not be nil", ^{
            NSString *string = @"";
            [[string shouldNot] beNil];
        });
        
        it(@"should not contain any value", ^{
            NSString *string = @"";
            [[theValue([string length]) shouldNot] beGreaterThan:theValue(0)];
        });
    });
    
    context(@"when created with a name", ^{
        it(@"should contain the correct number of characters", ^{
            NSString *string = @"abcdefghijklm";
            [[theValue([string length]) should] equal:theValue(13)];
        });
    });
});

SPEC_END
