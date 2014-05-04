//
//  TastyEndpoint.h
//  Tasty
//
//  Created by Alecca on 2014-05-04.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface TastyEndpoint : NSObject
@property NSString *apiKey;
@property NSString *appId;
@property NSString *endpoint;
@property NSString *version;
- (id)initWithAppId:(NSString *)appId apiKey:(NSString *)apiKey endpoint:(NSString *)endpoint version:(NSString *)version;
- (NSMutableDictionary *)requestWithURL:(NSString *)address withMethod:(NSString *)method withObject:(NSMutableDictionary *)object;
- (NSMutableDictionary *)getObjectsForResource:(NSString *)resource withId:(NSString *)identifier;
- (NSMutableDictionary *)getObjectsForResource:(NSString *)resource withQuery:(NSDictionary *)query;
- (NSMutableDictionary *)postObject:(NSMutableDictionary *)object forResource:(NSString *)resource;
- (NSMutableDictionary *)putObject:(NSMutableDictionary *)object forResourc:(NSString *)resource;
- (NSMutableDictionary *)deleteObject:(NSMutableDictionary *)object forResource:(NSString *)resource;
@end
