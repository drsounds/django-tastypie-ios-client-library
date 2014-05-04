//
//  TastyObject.m
//  Tasty
//
//  Created by Alecca on 2014-05-04.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import "TastyObject.h"

@implementation TastyObject
- (id)objectForKey:(id<NSCopying>)aKey {
    return [super objectForKey:aKey];
}
- (void)removeObjectForKey:(id<NSCopying>)aKey {
    [super removeObjectForKey:aKey];
}
- (void)setObject:(id)object forKey:(id<NSCopying>)aKey {
    [super setObject:object forKey:aKey];
}
- (NSUInteger)count {
    return [super count];
}
- (NSEnumerator *)keyEnumerator {
    return [super keyEnumerator];
}
- (id)initWithData:(NSData *)data {
    self = [super init];
    if (self) {
        NSError *error = nil;
        NSMutableDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSEnumerator *enumerator = [object keyEnumerator];
        // Copy items to current object
        // From http://foobarpig.com/iphone/iterating-through-nsdictionary.html
        id key;
        
        while ((key = [enumerator nextObject])) {
            NSObject *tmp = [object objectForKey:key];
            [self setObject:tmp forKey:key];
        }
    }
    return self;
}
@end
