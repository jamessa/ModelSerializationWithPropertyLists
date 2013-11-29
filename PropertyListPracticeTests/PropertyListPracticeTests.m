//
//  PropertyListPracticeTests.m
//  PropertyListPracticeTests
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Airplane.h"

@interface PropertyListPracticeTests : XCTestCase {
  Airplane *anAirplane;
}

@end

@implementation PropertyListPracticeTests

- (void)setUp
{
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  anAirplane = [[Airplane alloc]init];
  anAirplane.model = @"Model default";
  anAirplane.registrationNumber = @"00000";
  anAirplane.airframeHours = 0;
}

- (void)tearDown
{
  anAirplane = nil;
  [super tearDown];
}

- (void)testPropertyListRepresentation
{
  id shouldBeDict = [anAirplane propertyListRepresentation];
  
  XCTAssertTrue([shouldBeDict isKindOfClass:[NSDictionary class]],@"should be dictionary");
}

- (void)testGeneratePropertyListRepresentation {
  Airplane *airplane = [Airplane airplaneWithPropertyListRepresentation:[anAirplane propertyListRepresentation]];
  
  XCTAssertEqual(airplane.model, anAirplane.model, @"should be the same");
}
@end
