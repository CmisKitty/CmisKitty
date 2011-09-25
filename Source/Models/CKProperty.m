//
//  CKProperty.m
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-10.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKProperty.h"

@implementation CKProperty

@synthesize identifier = _identifier;
@synthesize localName = _localName;
@synthesize queryName = _queryName;
@synthesize value = _value;
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

@end
