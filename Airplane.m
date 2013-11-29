//
//  Airplane.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import "Airplane.h"

@implementation Airplane

- (id)propertyListRepresentation {
  NSMutableDictionary *dict = [NSMutableDictionary dictionary];
  dict[@"model"] = _model;
  dict[@"registrationNumber"] = _registrationNumber;
  dict[@"airframeHours"] = @(_airframeHours);
  return dict;
}

+ (instancetype)airplaneWithPropertyListRepresentation:(id)plist {
  Airplane *airplane = [[self alloc]init];
  [airplane setModel: plist[@"model"]];
  [airplane setRegistrationNumber:plist[@"registartionNumber"]];
  [airplane setAirframeHours:[plist[@"airframeHours"] unsignedLongLongValue]];
  return airplane;
}

@end
