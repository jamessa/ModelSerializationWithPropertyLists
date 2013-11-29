//
//  Pilot.h
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pilot : NSObject

@property (copy) NSString *name;
@property (copy) NSArray *airplanes;

- (id)propertyListRepresentation;
+(instancetype) pilotWithPropertyListRepresentation:(id)plist;

@end
