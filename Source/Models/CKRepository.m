//
//  CKRepository.m
//  CKBrowser
//
//  Created by Björn Jonsson on 2011-09-03.
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

#import "CKRepository.h"
#import <RestKit/RestKit.h>
#import "CKAccountManager.h"

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
    
    CKAccountManager * manager = [CKAccountManager activeManager];
    NSString * baseUrl = [[manager.objectManager client] baseURL];
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
