//
//  CKDateValue.m
//  CmisKitty
//
//  Created by Bjorn Jonsson on 2011-10-13.
//  Copyright 2011 CmisKitty. All rights reserved.
//

#import "CKDateProperty.h"

@implementation CKDateProperty

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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocale:usLocale];
    
    return [dateFormatter stringFromDate:self.value];
    //return [self.value time]
}

@end
