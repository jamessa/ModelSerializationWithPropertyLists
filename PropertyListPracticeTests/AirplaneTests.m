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
  NSURL *filePath;
}

@property (strong, nonatomic) Airplane *airplane;

- (void)saveToURL: (NSURL*)url;
- (void)readFromURL: (NSURL*)url;

@end

@implementation PropertyListPracticeTests

- (void)saveToURL:(NSURL *)url {
  id plist = [_airplane propertyListRepresentation];
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

- (void)readFromURL:(NSURL *)url {
  NSError *error;
  NSData *plistData = [NSData dataWithContentsOfURL:url options:0 error:&error];
  if (!plistData) {
    NSLog(@"Unable to read plist data from disk: %@", error);
    return;
  }
  id plist = [NSPropertyListSerialization propertyListWithData:plistData options:0 format:NULL error:&error];
  if (!plist) {
    NSLog(@"Unable dto decode plist from data: %@", error);
    return;
  }
  _airplane = [Airplane airplaneWithPropertyListRepresentation:plist error:nil];
}

#pragma marke - UnitTest

- (void)setUp
{
  [super setUp];
  // Put setup code here. This method is called before the invocation of each test method in the class.
  _airplane = [[Airplane alloc]init];
  _airplane.model = @"Model default";
  _airplane.registrationNumber = @"00000";
  _airplane.airframeHours = 0;
  filePath = [NSURL fileURLWithPath:@"airport"];

}

- (void)tearDown
{
  _airplane = nil;
  [super tearDown];
}

- (void)testPropertyListRepresentation
{
  id shouldBeDict = [_airplane propertyListRepresentation];
  
  XCTAssertTrue([shouldBeDict isKindOfClass:[NSDictionary class]],@"should be dictionary");
}

- (void)testGeneratePropertyListRepresentation {
  Airplane *anAirplane = [Airplane airplaneWithPropertyListRepresentation:[_airplane propertyListRepresentation] error:nil];
  
  XCTAssertEqual(_airplane.model, anAirplane.model, @"should be the same");
}

- (void)testSave {
  [self saveToURL:filePath];
  
  NSFileManager *fileManager = [NSFileManager defaultManager];
  
  XCTAssertTrue([fileManager fileExistsAtPath:[filePath path]], @"file should exist");
}

- (void)testLoad {
  _airplane.model = @"Model Saved";
  [self saveToURL:filePath];
  _airplane.model = @"Model Default";
  [self readFromURL:filePath];
  XCTAssertEqualObjects(_airplane.model, @"Model Saved", @"should be saved");
}

@end
