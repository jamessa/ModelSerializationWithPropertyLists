//
//  GliderTests.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Glider.h"
#import "Pilot.h"

@interface GliderTests : XCTestCase

@property (strong) Glider *glider;

@end

@implementation GliderTests

- (void)setUp
{
  [super setUp];
  _glider = [[Glider alloc] init];
  _glider.model = @"Schempp-Hirth Duo Discus";
  _glider.registrationNumber = @"Thomas";
  _glider.airframeHours = 1000;
  _glider.aerotowLaunchCount  = 10;
  _glider.winchLaunchCount = 5;
}

- (void)tearDown
{
  // Put teardown code here. This method is called after the invocation of each test method in the class.
  [super tearDown];
}

- (void)testInstance
{
  Glider *aGlider =[Glider airplaneWithPropertyListRepresentation: [self.glider propertyListRepresentation]];
  XCTAssertEqual(aGlider.winchLaunchCount, _glider.winchLaunchCount, @"derived properties should be the same.");
}

@end
