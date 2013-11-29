//
//  Airplane.h
//  PropertyListPractice
//
//  Created by jamie on 11/29/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Airplane : NSObject

@property (copy) NSString *model;
@property (copy) NSString *registrationNumber;
@property unsigned long long airframeHours;

- (id)propertyListRepresentation;
+ (instancetype) airplaneWithPropertyListRepresentation: (id)plist;

@end
