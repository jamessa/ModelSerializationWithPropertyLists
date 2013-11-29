//
//  Glider.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import "Glider.h"

@implementation Glider

- (id)propertyListRepresentation {
  // We know that super returns a mutable dictionary
  // so stuff more entries into that.
  NSMutableDictionary *dict = [super propertyListRepresentation];
  dict[@"aerotowLaunchCount"] = @(_aerotowLaunchCount);
  dict[@"winchLaunchCount"] = @(_winchLaunchCount);
  return dict;
}

+ (instancetype)airplaneWithPropertyListRepresentation:(id)plist {
  Glider *airplane = [super airplaneWithPropertyListRepresentation:plist];
  airplane.aerotowLaunchCount = [plist[@"aerotoLaunchCount"] unsignedLongLongValue];
  airplane.winchLaunchCount = [plist[@"winchLaunchCount"] unsignedLongLongValue];
  return airplane;
}


@end
