//
//  CKObject.m
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-06.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKObject.h"

#import "CKProperty.h"

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

-(void)setValueOfPropertyWithIdentifier:(NSString *)identifier value:(id)value {
    
     
    NSUInteger index = [self indexOfPropertyWithIdentifer:identifier];
    if (index != NSNotFound) {
        CKProperty * property = [_properties objectAtIndex:index];
        property.value = value;
    }else{
        CKProperty * property = [[CKProperty alloc] init];
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
    [self setValueOfPropertyWithIdentifier:@"cmis:objectId" value:objectId];
}

-(NSString *)name{
    return (NSString *)[self valueOfPropertyWithIdentifier:@"cmis:name"];
}

-(void)setName:(NSString *)name{
    [self setValueOfPropertyWithIdentifier:@"cmis:name" value:name];
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
