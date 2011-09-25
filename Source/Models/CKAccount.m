//
//  CKAccount.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-15.
//  Copyright 2011 CmisKitty
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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

-(BOOL)isEqual:(id)other{
    
    // quick tests
    if (other == self) 
        return YES;
    if(!other || ![other isKindOfClass:[CKAccount class]])
        return NO;
    
    // test for equal values
    CKAccount * otherAccount = (CKAccount *)other;
    if ([_baseURL isEqual:otherAccount.baseURL] &&
        [_username isEqual:otherAccount.username] &&
        [_password isEqual:otherAccount.password] &&
        _accountType == otherAccount.accountType)
        return YES;
    
    // return NO otherwise
    return NO;
    
}

-(NSUInteger)hash{
    
    int prime = 31;
    int result = 1;
    
    result = _baseURL ? prime * result + [_baseURL hash] : 0;
    result = _username ? prime * result + [_username hash] : 0;
    result = _password ? prime * result + [_password hash] : 0;
    result = prime * result + _accountType;
    return result;
}

@end
