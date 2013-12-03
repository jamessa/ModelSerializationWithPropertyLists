//
//  PoweredAirplane.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import "PoweredAirplane.h"

@implementation PoweredAirplane

- (id)propertyListRepresentation {
  // We know that super returns a mutable dictionary
  // so stuff more entries into that.
  NSMutableDictionary *dict = [super propertyListRepresentation];
  dict[@"engineHorsePower"] = @(_engineHorsePower);
  dict[@"engineHours"] = @(_engineHours);
  return dict;
}

+ (instancetype)airplaneWithPropertyListRepresentation:(id)plist error:(NSError *__autoreleasing *)outError {
  PoweredAirplane *airplane = [super airplaneWithPropertyListRepresentation:plist error:nil];
  airplane.engineHorsePower = [plist[@"engineHorsePower"] intValue];
  airplane.engineHours = [plist[@"engineHours"] unsignedLongLongValue];
  return airplane;
}

@end
