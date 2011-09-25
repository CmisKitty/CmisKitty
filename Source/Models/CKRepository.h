//
//  CBRepository.h
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-03.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
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
