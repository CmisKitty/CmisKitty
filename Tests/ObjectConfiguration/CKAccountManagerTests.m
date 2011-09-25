//
//  CKAccountManagerTests.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-25.
//  Copyright 2011 CmisKitty. All rights reserved.
//

#import "CKAccountManagerTests.h"
#import "CKAccountManager.h"
#import "CKAccount.h"

@implementation CKAccountManagerTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testManagerForAccount{
    
    CKAccount * account = [[[CKAccount alloc] init] autorelease];
    account.baseURL = @"url";
    account.username = @"user";
    account.password= @"pass";
    account.accountType = kCKAccountTypeJSON;
    
    CKAccountManager * manager = [CKAccountManager managerForAccount:account];
    STAssertNotNil(manager, @"manager should not be nil");
    STAssertEqualObjects(account, manager.account, @"manager's account should be equal to original account");
    
    CKAccount * accountCopy = [[account copy] autorelease];
    CKAccountManager * copyManager = [CKAccountManager managerForAccount:accountCopy];
    STAssertNotNil(copyManager, @"manager should not be nil");
    STAssertEqualObjects(accountCopy, copyManager.account, @"manager's account should be equal to original account");
    STAssertEqualObjects(manager, copyManager, @"managers should be equal");
    
}

@end
