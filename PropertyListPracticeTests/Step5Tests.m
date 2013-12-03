//
//  Step5Tests.m
//  PropertyListPractice
//
//  Created by jamie on 12/3/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Glider.h"
#import "Pilot.h"

@interface Step5Tests : XCTestCase

@end

@implementation Step5Tests

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

- (void)testSubclass {
  Glider *glider = [[Glider alloc] init];
  glider.model = @"a glider";
  glider.registrationNumber = @"some number";
  glider.airframeHours = 1;
  glider.aerotowLaunchCount = 10;
  glider.winchLaunchCount = 20;
  
  Airplane *airplane = [[Airplane alloc] init];
  airplane.model = @"a airplane";
  airplane.registrationNumber = @"another number";
  airplane.airframeHours = 2;
  
  Pilot *pilot = [[Pilot alloc] init];
  pilot.name = @"Thomas Crown";
  pilot.airplanes = @[airplane,glider];
  
  Pilot *aPilot = [Pilot pilotWithPropertyListRepresentation:[pilot propertyListRepresentation]];
  
  XCTAssertEqualObjects([aPilot.airplanes[1] class], [Glider class], @"should be Glider");
}

@end
