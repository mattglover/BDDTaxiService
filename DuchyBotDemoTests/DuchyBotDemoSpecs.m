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
        
        __block NSString *string;
        beforeEach(^{
            string = @"";
        });
        
        it(@"should not be nil", ^{
            [[string shouldNot] beNil];
        });
        
        it(@"should not contain any value", ^{
            [[theValue([string length]) shouldNot] beGreaterThan:theValue(0)];
        });
    });
    
    context(@"when created with a name", ^{
        
        __block NSString *string;
        beforeEach(^{
            string = @"ABCdefghijklm";
        });
        
        it(@"should contain the correct number of characters", ^{
            [[theValue([string length]) should] equal:theValue(13)];
        });
        
        it(@"should be prefixed with the letters ABC", ^{
            [[string should] startWithString:@"ABC"];
        });
    });
    
});

SPEC_END
