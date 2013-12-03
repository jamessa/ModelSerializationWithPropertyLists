//
//  Test7.m
//  PropertyListPractice
//
//  Created by jamie on 12/3/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Airplane.h"

@interface Test7 : XCTestCase
@end

@implementation Test7

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testNil
{
  Airplane *airplane = [[Airplane alloc] init];
  id shouldBeDict = [airplane propertyListRepresentation];
  
  XCTAssertTrue([shouldBeDict isKindOfClass:[NSDictionary class]],@"should be dictionary");
}
@end
