//
//  PilotTests.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Pilot.h"
#import "Airplane.h"

@interface PilotTests : XCTestCase
@property (strong) Pilot *pilot;

@end

@implementation PilotTests

- (void)setUp
{
  [super setUp];
  _pilot = [[Pilot alloc] init];
  _pilot.name = @"Pilot 1";
  Airplane *airplane1 = [[Airplane alloc]init];
  airplane1.model = @"Boing 747";
  airplane1.registrationNumber = @"Rocketeer";
  airplane1.airframeHours = 10;
  
  _pilot.airplanes = @[airplane1];
}

- (void)tearDown
{
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  _pilot = nil;
  [super tearDown];
}

- (void)testRepresentation
{
  id propertyList = [_pilot propertyListRepresentation];
  
  XCTAssertTrue([propertyList isKindOfClass:[NSDictionary class]], @"should be dictionary");
}

- (void)testPilotInstance {
  Pilot *aPilot = [Pilot pilotWithPropertyListRepresentation:[_pilot propertyListRepresentation]];
  
  XCTAssertEqualObjects(aPilot.name, self.pilot.name, @"should be the same pilot");
}

@end
