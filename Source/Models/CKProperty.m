//
//  CKProperty.m
//  CKBrowser
//
//  Created by Björn Jonsson on 2011-09-10.
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

#import "CKProperty.h"

@implementation CKProperty

@synthesize identifier = _identifier;
@synthesize localName = _localName;
@synthesize queryName = _queryName;
@synthesize type = _type;
@synthesize displayName = _displayName;
@synthesize cardinality = _cardinality;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSString *)displayValue{
    NSAssert(NO, @"Subclass must override displayValue method of property");
    return nil;
}

-(id)value{
    NSAssert(NO, @"Subclass must override value method of property");
    return nil;
}

-(void)setValue:(id)value{
    NSAssert(NO, @"Subclass must override setValue method of property");
}

@end
