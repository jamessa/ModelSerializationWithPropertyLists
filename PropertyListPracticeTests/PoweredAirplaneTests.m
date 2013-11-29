//
//  PoweredAirplane.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PoweredAirplane.h"

@interface PoweredAirplaneTests : XCTestCase

@property (strong) PoweredAirplane *poweredAirplane;

@end

@implementation PoweredAirplaneTests

- (void)setUp
{
  [super setUp];
  _poweredAirplane = [[PoweredAirplane alloc] init];
  _poweredAirplane.model = @"Boing 747";
  _poweredAirplane.registrationNumber = @"California";
  _poweredAirplane.airframeHours = 999;
  _poweredAirplane.engineHorsePower = 10000;
  _poweredAirplane.engineHours = 999999;
}

- (void)tearDown
{
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testRepresentation
{
  id aPoweredAirplane = [self.poweredAirplane propertyListRepresentation];
  
  XCTAssertEqual([(NSNumber*)aPoweredAirplane[@"engineHorsePower"] unsignedLongLongValue], _poweredAirplane.engineHorsePower, @"should be the same");
}

- (void)testInstance {
  
  PoweredAirplane *aPoweredAirplane = [PoweredAirplane airplaneWithPropertyListRepresentation:[self.poweredAirplane propertyListRepresentation]];
  
  XCTAssertEqual(aPoweredAirplane.engineHorsePower, _poweredAirplane.engineHorsePower, @"should be the same");
}

@end
