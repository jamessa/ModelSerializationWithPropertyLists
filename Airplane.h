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
+ (instancetype) airplaneWithPropertyListRepresentation: (id)plist error: (NSError **)outError;

@end

NSString *const kPlistTypeErrorDomain;
enum {
  kPlistBadTypeError,
  kPlistMissingKeyError
};

NSString *const kPlistTypeErrorKeyName;

#define CHECK_REQUIRED(variable, key, outError) \
if (!(variable)) { \
if (outError) { \
*outError = [NSError errorWithDomain:kPlistTypeErrorDomain code:kPlistMissingKeyError userInfo:@{kPlistTypeErrorKeyName: (key)}]; \
} \
return nil; \
}

#define CHECK_TYPE(variable, type, key, outError) \
if (![(variable) isKindOfClass:(type)]) { \
if (outError) { \
*outError = [NSError errorWithDomain:kPlistTypeErrorDomain code:kPlistBadTypeError userInfo:@{kPlistTypeErrorKeyName: (key)}]; \
} \
return nil; \
}