//
//  CKFolder.m
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-11.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKFolder.h"

@implementation CKFolder

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(BOOL)isRootFolder{
    
    return self.repository && self.repository.rootFolderId && [self.repository.rootFolderId isEqualToString:self.objectId];
}

@end
