//
//  CBRepository.h
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

#import <Foundation/Foundation.h>


@interface CKRepository : NSObject{
    
    NSString * _identifier;
    NSString * _description;
    NSString * _productVersion;
    NSString * _vendorName;
    NSString * _rootFolderId;
    NSString * _productName;
    NSString * _cmisVersionSupported;
    NSString * _repositoryName;
    NSString * _rootFolderUrl;
    
}

@property(nonatomic,retain) NSString * identifier;
@property(nonatomic,retain) NSString * description;
@property(nonatomic,retain) NSString * productVersion;
@property(nonatomic,retain) NSString * vendorName;
@property(nonatomic,retain) NSString * rootFolderId;
@property(nonatomic,retain) NSString * productName;
@property(nonatomic,retain) NSString * cmisVersionSupported;
@property(nonatomic,retain) NSString * repositoryName;
@property(nonatomic,retain) NSString * rootFolderUrl;

-(NSString *) rootFolderResourcePath;

@end
