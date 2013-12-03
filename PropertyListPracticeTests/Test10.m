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

- (void)testErrorChecking
{
  Airplane *airplane = [[Airplane alloc] init];
  
  id anAirplaneWithWrongModel = [airplane propertyListRepresentation];
  anAirplaneWithWrongModel[@"model"] = @1;
  
  Airplane *invalidPlane = [Airplane airplaneWithPropertyListRepresentation:anAirplaneWithWrongModel];
}

@end
