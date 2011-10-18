//
//  CKIntegerValue.m
//  CmisKitty
//
//  Created by Bjorn Jonsson on 2011-10-13.
//  Copyright 2011 CmisKitty. All rights reserved.
//

#import "CKIntegerProperty.h"

@implementation CKIntegerProperty

@synthesize value = _value;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(NSString *)displayValue{
    return [self.value stringValue];
}

@end
