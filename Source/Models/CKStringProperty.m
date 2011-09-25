//
//  CKStringProperty.m
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-10.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKStringProperty.h"

@implementation CKStringProperty

-(NSString *) stringValue{
    
    return [NSString stringWithFormat:@"%@", self.value];
    
}

-(void) setStringValue:(NSString *)aValue{
    
    self.value = aValue;
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
