//
//  TastyTests.m
//  TastyTests
//
//  Created by Alecca on 2014-05-04.
//  Copyright (c) 2014 Alexander Forselius. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TastyEndpoint.h"
@interface TastyTests : XCTestCase
@property TastyEndpoint *endpoint;
@end

@implementation TastyTests

- (void)setUp
{
    [super setUp];
    self.endpoint = [[TastyEndpoint alloc] initWithAppId:@"alecca" apiKey:@"d86e43b4f6b564e98a1babc601a1021db7bcace9" endpoint:@"http://10.0.0.10/api" version:@"v1"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGet
{
    NSMutableDictionary *result = [self.endpoint getObjectsForResource:@"product" withId:@"1"];
    assert(result != nil);
}
- (void)testPost {
    NSMutableDictionary *orderline = [[NSMutableDictionary alloc] init];
    [orderline setObject:@"/v1/api/product/1/" forKey:@"product"];
    [orderline setObject:@"/v1/api/sku/test1/" forKey:@"sku"];
    [orderline setObject:@"1000" forKey:@"price"];
    [orderline setObject:@"1000" forKey:@"subtotal"];
    [orderline setObject:@"/api/v1/merchant/artistconnector/" forKey:@"merchant"];
    
    NSMutableDictionary *order = [[NSMutableDictionary alloc] init];
    NSMutableArray *orderlines = [[NSMutableArray alloc] init];
    [orderlines addObject:orderline];
    [order setObject:orderlines forKey:@"orderlines"];
    [order setObject:@"1000" forKey:@"total"];
    [order setObject:@"250" forKey:@"vat"];
    [order setObject:@"/api/v1/customer/9103160000/" forKey:@"customer"];
    [order setObject:@"/api/v1/currency/SEK/" forKey:@"currency"];
    [order setObject:@"/api/v1/merchant/artistconnector/" forKey:@"merchant"];
    NSMutableDictionary *result = [self.endpoint postObject:order forResource:@"order"];
    assert(result != nil);
}
@end
