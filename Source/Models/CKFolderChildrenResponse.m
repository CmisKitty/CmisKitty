//
//  CKFolderChildrenResponse.m
//  CKBrowser
//
//  Created by Björn Jonsson on 2011-09-10.
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
