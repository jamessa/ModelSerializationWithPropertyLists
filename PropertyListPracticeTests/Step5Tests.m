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
@property (strong) Pilot *pilot;

@end

@implementation Step5Tests

- (void)saveToURL:(NSURL *)url {
  id plist = [_pilot propertyListRepresentation];
  NSError *error;
  NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:plist format:NSPropertyListBinaryFormat_v1_0 options:0 error:&error];
  if (!plistData) {
    NSLog(@"Unable to generate plist from Airplane: %@", error);
  }
  
  BOOL success = [plistData writeToURL:url options:NSDataWritingAtomic error:&error];
  if (!success) {
    NSLog(@"Unable to write plist data to disk: %@", error);
  }
}

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
  
  _pilot = [[Pilot alloc] init];
  _pilot.name = @"Thomas Crown";
  _pilot.airplanes = @[airplane,glider];
  
  Pilot *aPilot = [Pilot pilotWithPropertyListRepresentation:[_pilot propertyListRepresentation]];
  
  XCTAssertEqualObjects([aPilot.airplanes[1] class], [Glider class], @"should be Glider");
  
  [self saveToURL:[NSURL fileURLWithPath:@"pilots"]];
}

@end
