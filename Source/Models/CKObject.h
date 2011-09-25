//
//  CKObject.h
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-06.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CKRepository.h"

@interface CKObject : NSObject{
    
    @private
    CKRepository * _repository;
    NSArray * _properties;
    
}

@property(nonatomic,retain) CKRepository * repository;
@property(nonatomic,retain) NSArray * properties;


// convenience accessors for common properties
@property(nonatomic,retain) NSString * objectId;
@property(nonatomic,retain) NSString * name;

@end
