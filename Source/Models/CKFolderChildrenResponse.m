//
//  CKFolderChildrenResponse.m
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-10.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKFolderChildrenResponse.h"

@implementation CKFolderChildrenResponse

@synthesize hasMoreItems = _hasMoreItems;
@synthesize numItems = _numItems;
@synthesize objects = _objects;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
