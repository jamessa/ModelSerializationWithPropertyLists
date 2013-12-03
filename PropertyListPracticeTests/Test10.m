//
//  Test10.m
//  PropertyListPractice
//
//  Created by jamie on 12/3/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Airplane.h"

@interface Test10 : XCTestCase

@end

@implementation Test10

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

- (void)testErrorCheckingBadType
{
  Airplane *airplane = [[Airplane alloc] init];
  
  id anAirplaneWithWrongModel = [airplane propertyListRepresentation];
  anAirplaneWithWrongModel[@"model"] = @1;
  
  NSError *error;
  Airplane *invalidPlane = [Airplane airplaneWithPropertyListRepresentation:anAirplaneWithWrongModel error:&error];
  
  XCTAssertNil(invalidPlane, @"Wrong type should result nil");
  XCTAssertEqual(error.code, kPlistBadTypeError, @"error should be bad type");
}

- (void)testErrorCheckingMissingProperty {
  Airplane *airplane = [[Airplane alloc] init];
  
  NSMutableDictionary *anAirplaneWithMissingRequiredModelProperty = [airplane propertyListRepresentation];
  
  NSError *error;
  Airplane *invalidPlane = [Airplane airplaneWithPropertyListRepresentation:anAirplaneWithMissingRequiredModelProperty error:&error];
  
  XCTAssertNil(invalidPlane, @"Missing required property should result nil");
  XCTAssertEqual(error.code, kPlistMissingKeyError, @"error should be missing key type");
}

@end
