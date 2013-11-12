//
//  DuchyBotDemoTests.m
//  DuchyBotDemoTests
//
//  Created by Matt Glover on 12/11/2013.
//  Copyright (c) 2013 Duchy Software Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DuchyBotDemoTests : XCTestCase

@end

@implementation DuchyBotDemoTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    XCTAssertEqual(4, 2 + 2, @"This should be simple maths");
}

@end
