//
//  CKAccount.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-15.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKAccount.h"

@implementation CKAccount

@synthesize baseURL = _baseURL;
@synthesize accountType = _accountType;
@synthesize username = _username;
@synthesize password = _password;

- (id)init
{
    self = [super init];
    if (self) {
        _accountType = kCKAccountTypeJSON;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    CKAccount * copy = (CKAccount *)[[[self class] alloc] init];
    
    if (copy) {
        copy.baseURL = [[self.baseURL copyWithZone:zone] autorelease];
        copy.username = [[self.username copyWithZone:zone] autorelease];
        copy.password = [[self.password copyWithZone:zone] autorelease];
        
        copy.accountType = self.accountType;
    }
    
    return copy;
}

@end
