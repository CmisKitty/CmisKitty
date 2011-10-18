//
//  CKBooleanProperty.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-10-11.
//  Copyright 2011 CmisKitty. All rights reserved.
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

#import "CKBooleanProperty.h"

@implementation CKBooleanProperty

@synthesize value = _value;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(BOOL)booleanValue{
    return [self.value boolValue];
}

-(void)setBooleanValue:(BOOL)booleanValue{
    self.value = [NSNumber numberWithBool:booleanValue];
}

-(NSString *)displayValue{
    return self.booleanValue ? @"Yes" : @"No";
}

@end
