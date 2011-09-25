//
//  CKObjectManagerConfigurator.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-12.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKObjectManagerJSONConfigurator.h"
#import "CKModels.h"



@implementation CKObjectManagerJSONConfigurator

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)configureObjectManager:(RKObjectManager *) manager{
    
    manager.inferMappingsFromObjectTypes = YES;
    
    // ROUTING
    RKObjectRouter* router = [RKObjectRouter new];
    [RKObjectManager sharedManager].router = router; 
    [router routeClass:[CKRepository class] toResourcePath:@"/:identifier"];
    [router routeClass:[CKObject class] toResourcePath:@"/:repository.rootFolderResourcePath?objectId=:objectId&selector=object"];  
    
    // OBJECT MAPPINGS
    // repository collection mapping
    RKObjectMapping* repositoriesMapping = [RKObjectMapping mappingForClass:[CKRepository class]];
    repositoriesMapping.forceCollectionMapping = YES;
    [repositoriesMapping mapKeyOfNestedDictionaryToAttribute:@"identifier"];
    [repositoriesMapping mapKeyPathsToAttributes:
     @"(identifier).repositoryName", @"repositoryName",
     @"(identifier).rootFolderId", @"rootFolderId",
     @"(identifier).rootFolderUrl", @"rootFolderUrl", 
     nil];
    [manager.mappingProvider setMapping:repositoriesMapping forKeyPath:@""];
    
    // repository 
    RKObjectMapping* repositoryMapping = [RKObjectMapping mappingForClass:[CKRepository class]];
    [repositoryMapping mapKeyPathsToAttributes:
     @"repositoryId", @"identifier", 
     @"repositoryName", @"repositoryName",
     @"rootFolderUrl", @"rootFolderUrl", 
     nil];
    [manager.mappingProvider addObjectMapping:repositoryMapping];
    
    // property
    RKObjectMapping* stringPropertyMapping = [RKObjectMapping mappingForClass:[CKStringProperty class]];
    stringPropertyMapping.forceCollectionMapping = YES;
    [stringPropertyMapping mapKeyOfNestedDictionaryToAttribute:@"identifier"];
    [stringPropertyMapping mapKeyPathsToAttributes:
     @"(identifier).localName", @"localName",
     @"(identifier).queryName", @"queryName",
     @"(identifier).value", @"value",
     @"(identifier).type", @"type",
     @"(identifier).displayName", @"displayName",
     @"(identifier).cardinality", @"cardinality",
     nil
     ];
    [manager.mappingProvider setMapping:stringPropertyMapping forKeyPath:@"properties"];
    
    // object mapping
    RKObjectMapping * folderMapping = [RKObjectMapping mappingForClass:[CKFolder class]];
    [folderMapping mapKeyPath:@"object.properties" toRelationship:@"properties" withMapping:stringPropertyMapping];
    [manager.mappingProvider addObjectMapping:folderMapping];
    
    RKObjectMapping * documentMapping = [RKObjectMapping mappingForClass:[CKDocument class]];
    [documentMapping mapKeyPath:@"object.properties" toRelationship:@"properties" withMapping:stringPropertyMapping];
    [manager.mappingProvider addObjectMapping:documentMapping];
    
    RKObjectDynamicMapping* objectMapping = [RKObjectDynamicMapping dynamicMapping];
    [objectMapping setObjectMapping:folderMapping whenValueOfKeyPath:@"object.properties.cmis:objectTypeId.value" isEqualTo:@"cmis:folder"];
    [objectMapping setObjectMapping:folderMapping whenValueOfKeyPath:@"object.properties.cmis:objectTypeId.value" isEqualTo:@"cmis:document"];
    [manager.mappingProvider setMapping:objectMapping forKeyPath:@"object"];
    
    // response mapping
    RKObjectMapping * responseMapping = [RKObjectMapping mappingForClass:[CKFolderChildrenResponse class]];
    [responseMapping mapKeyPathsToAttributes:
     @"hasMoreItems", @"hasMoreItems",
     @"numItems", @"numItems",
     nil
     ];
    [responseMapping hasMany:@"objects" withMapping:objectMapping];
    [manager.mappingProvider addObjectMapping:responseMapping];
    
}


@end
