//
//  CBRepository.m
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-03.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKRepository.h"
#import <RestKit/RestKit.h>

@implementation CKRepository

@synthesize identifier = _identifier;
@synthesize description = _description;
@synthesize productVersion = _productVersion;
@synthesize vendorName = _vendorName;
@synthesize rootFolderId = _rootFolderId;
@synthesize productName = _productName;
@synthesize cmisVersionSupported = _cmisVersionSupported;
@synthesize repositoryName = _repositoryName;
@synthesize rootFolderUrl = _rootFolderUrl;

-(NSString *) rootFolderResourcePath{
    
    NSString * baseUrl = [[[RKObjectManager sharedManager] client] baseURL];
    return [self.rootFolderUrl stringByReplacingOccurrencesOfString:baseUrl withString:@""];
    
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
