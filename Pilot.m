//
//  Pilot.m
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import "Pilot.h"
#import "Airplane.h"
#import <MACollectionUtilities.h>

@implementation Pilot

- (id)propertyListRepresentation {
  NSMutableDictionary *dict = [NSMutableDictionary dictionary];
  dict[@"name"] = _name;
  dict[@"airplanes"] = MAP(_airplanes, [obj propertyListRepresentation]);
  return dict;
}

+ (instancetype)pilotWithPropertyListRepresentation:(id)plist {
  Pilot *pilot = [[Pilot alloc]init];
  pilot.name = plist[@"name"];
  pilot.airplanes = MAP(plist[@"airplanes"], [Airplane airplaneWithPropertyListRepresentation:obj]);
  return pilot;
}
@end
