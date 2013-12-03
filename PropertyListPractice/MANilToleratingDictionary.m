//
//  MANilToleratingDictionary.m
//  PropertyListPractice
//
//  Created by jamie on 12/3/13.
//  Copyright (c) 2013 2think. All rights reserved.
//

#import "MANilToleratingDictionary.h"

@implementation MANilToleratingDictionary {
  NSMutableDictionary *_innerDictionary;
}

#pragma mark - designated initializer

- (instancetype) init {
  self = [super init];
  _innerDictionary = [NSMutableDictionary dictionary];
  return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
  self = [super init];
  _innerDictionary = [[NSMutableDictionary alloc]initWithCapacity:numItems];
  return self;
}

#pragma mark - immutable dictionary interface

- (NSUInteger)count {
  return [_innerDictionary count];
}

- (id)objectForKey:(id)aKey {
  return [_innerDictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator {
  return [_innerDictionary keyEnumerator];
}

#pragma mark - mutable dictionary interface

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
  if (anObject) {
    [_innerDictionary setObject:anObject forKey:aKey];
  }
}

@end
