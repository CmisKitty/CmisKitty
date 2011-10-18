//
//  CKIDProperty.m
//  CmisKitty
//
//  Created by Bjorn Jonsson on 2011-10-13.
//  Copyright 2011 CmisKitty. All rights reserved.
//

#import "CKIDProperty.h"

@implementation CKIDProperty

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
    return self.value;
}

@end
