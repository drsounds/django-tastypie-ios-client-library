//
//  TastyObject.h
//  Tasty
//
//  Created by Alecca on 2014-05-04.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TastyObject : NSMutableDictionary
- (id)initWithData:(NSData *)data;
- (void)setObject:(id)object forKey:(id<NSCopying>)aKey;
- (void)removeObjectForKey:(id<NSCopying>)aKey;
- (NSUInteger)count;
- (NSEnumerator *)keyEnumerator;
- (id)objectForKey:(id<NSCopying>)aKey;
@end
