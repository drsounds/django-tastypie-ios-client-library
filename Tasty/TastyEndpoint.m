//
//  TastyEndpoint.m
//  Tasty
//
//  Created by Alecca on 2014-05-04.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import "TastyEndpoint.h"

@implementation TastyEndpoint
- (id)initWithAppId:(NSString *)appId apiKey:(NSString *)apiKey endpoint:(NSString *)endpoint version:(NSString *)version {
    self = [super init];
    if (self) {
        self.appId = appId;
        self.apiKey = apiKey;
        self.endpoint = endpoint;
        self.version = version;
    }
    return self;
}

- (NSMutableDictionary *)requestWithURL:(NSString *)address withMethod:(NSString *)method withObject:(id)object {
    NSURL *url = [NSURL URLWithString:address];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:[NSString stringWithFormat:@"ApiKey %@:%@", [self appId], [self apiKey]] forHTTPHeaderField:@"Authorization"];
    [request setHTTPMethod:method];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    NSData *requestData = nil;
    NSError *error = nil;
    NSURLResponse *response;
    NSData *responseData;
    if (object) {
        
    
        requestData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
        [request setHTTPBody:requestData];
    }
    if (error) {
        return nil;
    }
    
    responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        return nil;
    }
  
    
    NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    if (error) {
        return nil;
    }
    return result;
    
    
    
    
}
- (NSDictionary *)getObjectsForResource:(NSString *)resource withId:(NSString *)identifier {
    NSString *urlTemplate = @"%@/%@/?format=json&username=%@&api_key=%@";
    NSString *address = [NSString stringWithFormat:urlTemplate, [self endpoint], resource, self.appId, self.apiKey];
    NSDictionary *result = [self requestWithURL:address withMethod:@"GET" withObject:nil];
    return result;
}
- (NSMutableDictionary *)getObjectsForResource:(NSString *)resource withQuery:(NSMutableDictionary *)query {
    NSString *urlTemplate = @"%@/%@/?format=json&username=%@&api_key=%@";
    NSString *address = [NSString stringWithFormat:urlTemplate, [self endpoint], resource, self.appId, self.apiKey];
    NSMutableDictionary *result = [self requestWithURL:address withMethod:@"GET" withObject:query];
    return result;
}
- (NSMutableDictionary *)postObject:(NSMutableDictionary *)object forResource:(NSString *)resource {
    NSString *urlTemplate = @"%@/%@/";
    NSString *address = [NSString stringWithFormat:urlTemplate, [self endpoint], resource, self.appId, self.apiKey];
    NSMutableDictionary *result = [self requestWithURL:address withMethod:@"POST" withObject:object];
    return result;
}
- (NSMutableDictionary *)putObject:(NSMutableDictionary *)object forResourc:(NSString *)resource {
    NSString *urlTemplate = @"%@/%@/%@/?username=%@&api_key=%@";
    NSString *address = [NSString stringWithFormat:urlTemplate, [self endpoint], resource, [object objectForKey:@"id"], self.appId, self.apiKey];
    NSMutableDictionary *result = [self requestWithURL:address withMethod:@"PUT" withObject:object];
    return result;
}
- (NSMutableDictionary *)deleteObject:(NSDictionary *)object forResource:(NSString *)resource {
    NSString *urlTemplate = @"%@/%@/%@/?username=%@&api_key=%@";
    NSString *address = [NSString stringWithFormat:urlTemplate, [self endpoint], resource, [object objectForKey:@"id"], self.appId, self.apiKey];
    NSMutableDictionary *result = [self requestWithURL:address withMethod:@"DELETE" withObject:nil];
    return result;
}

@end
