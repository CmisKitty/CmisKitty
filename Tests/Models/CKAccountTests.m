//
//  CKAccountTests.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-25.
//  Copyright 2011 CmisKitty. All rights reserved.
//

#import "CKAccountTests.h"


@implementation CKAccountTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    account = [[CKAccount alloc] init];
    account.baseURL = @"url";
    account.username = @"user";
    account.password = @"pass";
    account.accountType = kCKAccountTypeJSON;
}

- (void)tearDown
{
    // Tear-down code here.
    [account release];
    [super tearDown];
}

-(void)testSetup{
    
    STAssertEqualObjects(@"url", account.baseURL, @"baseURL should be %@ but got %@", @"url", account.baseURL);
    STAssertEqualObjects(@"user", account.username, @"username should be %@ but got %@", @"username", account.username);
    STAssertEqualObjects(@"pass", account.password, @"password should be %@ but got %@", @"password", account.password);
    STAssertEquals(kCKAccountTypeJSON, account.accountType, @"accountType should be %d but got %d", kCKAccountTypeJSON, account.accountType);
}

-(void)testCopy{
    
    CKAccount * copy = [account copy];
    STAssertEqualObjects(account.baseURL, copy.baseURL, @"baseURL should be %@ but got %@", account.baseURL, copy.baseURL);
    STAssertEqualObjects(account.username, copy.username, @"username should be %@ but got %@", account.username, copy.username);
    STAssertEqualObjects(account.password, copy.password, @"password should be %@ but got %@", account.password, copy.password);
    STAssertEquals(account.accountType, copy.accountType, @"accountType should be %d but got %d", account.accountType, copy.accountType);
    [copy release];
}

-(void)testCopyWithZone{
    
    NSZone * zone = NSCreateZone(1024, 1024, YES);
    CKAccount * copy = [account copyWithZone:zone];
    STAssertEqualObjects(account.baseURL, copy.baseURL, @"baseURL should be %@ but got %@", account.baseURL, copy.baseURL);
    STAssertEqualObjects(account.username, copy.username, @"username should be %@ but got %@", account.username, copy.username);
    STAssertEqualObjects(account.password, copy.password, @"password should be %@ but got %@", account.password, copy.password);
    STAssertEquals(account.accountType, copy.accountType, @"accountType should be %d but got %d", account.accountType, copy.accountType);
    [copy release];
    NSRecycleZone(zone);	
}

-(void)testIsEqual{
    
    CKAccount * copy = [account copy];
    STAssertEqualObjects(account, copy, @"copy should be equal to account %@ but got %@", account, copy);
    
    copy.username = @"otheruser";
    STAssertFalse([account isEqual:copy], @"modified copy should not be equal to account %@ but got %@", account, copy);
}

-(void)testHash{
    
    CKAccount * copy = [account copy];
    STAssertEquals([account hash], [copy hash], @"hash should be equal to %d but got %d", [account hash], [copy hash]);
    
    copy.username = @"otheruser";
    STAssertFalse([account hash] == [copy hash], @"hash of modified copy should not be equal to hash of account %@ but got %@", account, copy);
    
}


@end
