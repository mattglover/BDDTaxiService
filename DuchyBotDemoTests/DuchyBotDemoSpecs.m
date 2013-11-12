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
            
            NSString *string = @"Matt Glover";
            [[string shouldNot] beNil];
        });
    });
});

SPEC_END
