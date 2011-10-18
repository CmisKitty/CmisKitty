//
//  CKObject.m
//  CKBrowser
//
//  Created by Björn Jonsson on 2011-09-06.
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

#import "CKObject.h"

#import "CKProperty.h"
#import "CKIDProperty.h"
#import "CKStringProperty.h"

@implementation CKObject

@synthesize repository = _repository;
@synthesize properties = _properties;


-(NSArray *)properties{
    if (!_properties) {
        _properties = [[NSArray alloc] init];
    }
    return _properties;
}

-(NSUInteger)indexOfPropertyWithIdentifer:(NSString *)identifier{
    
    NSUInteger index = NSNotFound;
    
    if (_properties) {
        index = [_properties indexOfObjectPassingTest: ^(id obj, NSUInteger idx, BOOL *stop){
            CKProperty * property = (CKProperty *)obj;
            return  [property.identifier isEqualToString:identifier];
        }];
    }

    return index;
}

-(id)valueOfPropertyWithIdentifier:(NSString *)identifier{
    
    id value = nil; 
    
    NSUInteger index = [self indexOfPropertyWithIdentifer:identifier];
    if (index != NSNotFound) {
        CKProperty * property = [_properties objectAtIndex:index];
        value = property.value;
    }
    return value;
}

-(void)setValueOfPropertyWithIdentifier:(NSString *)identifier value:(id)value type:(Class) clazz {
    
     
    NSUInteger index = [self indexOfPropertyWithIdentifer:identifier];
    if (index != NSNotFound) {
        CKProperty * property = [_properties objectAtIndex:index];
        property.value = value;
    }else{
        CKProperty * property = [[clazz alloc] init];
        property.identifier = identifier;
        property.value = value;
        
        NSMutableArray * tempArray = [NSMutableArray arrayWithCapacity:[self.properties count]+1];
        [tempArray addObjectsFromArray:self.properties];
        [tempArray addObject:property];
        self.properties = [NSArray arrayWithArray:tempArray];
    }
}

-(NSString *)objectId{
    return (NSString *)[self valueOfPropertyWithIdentifier:@"cmis:objectId"];
}

-(void)setObjectId:(NSString *)objectId{
    [self setValueOfPropertyWithIdentifier:@"cmis:objectId" value:objectId type:[CKIDProperty class]];
}

-(NSString *)name{
    return (NSString *)[self valueOfPropertyWithIdentifier:@"cmis:name"];
}

-(void)setName:(NSString *)name{
    [self setValueOfPropertyWithIdentifier:@"cmis:name" value:name type:[CKStringProperty class]];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
