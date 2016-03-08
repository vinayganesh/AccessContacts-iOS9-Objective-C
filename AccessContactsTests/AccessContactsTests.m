//
//  AccessContactsTests.m
//  AccessContactsTests
//
//  Created by vinayganesh on 3/7/16.
//  Copyright © 2016 vinayganesh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContactsManager.h"

@interface AccessContactsTests : XCTestCase

@end

@implementation AccessContactsTests

ContactsManager *cManager;

- (void)setUp {
    [super setUp];
    
    cManager = [ContactsManager new];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSArray *contactsNameArray = [cManager getAllContacts];
    NSUInteger count = contactsNameArray.count;
    
    XCTAssertEqual(163, count);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
