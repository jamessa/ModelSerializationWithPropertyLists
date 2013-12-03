//
//  Airplane.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import "Airplane.h"
#import "MANilToleratingDictionary.h"

NSString *const kPlistTypeErrorDomain = @"kPlistTypeErrorDomain";
NSString *const kPlistTypeErrorKeyName = @"kPlistTypeErrorKeyName";

@implementation Airplane

- (id)propertyListRepresentation {
  NSMutableDictionary *dict = [MANilToleratingDictionary dictionary];
  dict[@"class"] = NSStringFromClass([self class]);
  if (_model)
    dict[@"model"] = _model;
  if (_registrationNumber)
    dict[@"registrationNumber"] = _registrationNumber;
  if (_airframeHours)
      dict[@"airframeHours"] = @(_airframeHours);
  return dict;
}

+ (instancetype)airplaneWithPropertyListRepresentation:(id)plist error:(NSError *__autoreleasing *)outError {
  Class class = NSClassFromString(plist[@"class"]);
  Airplane *airplane = [[class alloc]init];
  id model = plist[@"model"];
  CHECK_REQUIRED(model, @"model", outError);
  CHECK_TYPE(model, [NSString class], @"model", outError);
  [airplane setModel: plist[@"model"]];
  
  [airplane setRegistrationNumber:plist[@"registartionNumber"]];
  [airplane setAirframeHours:[plist[@"airframeHours"] unsignedLongLongValue]];
  return airplane;
}

@end
