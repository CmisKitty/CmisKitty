//
//  CKProperty.h
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-10.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CKProperty : NSObject{
    
    NSString * _identifier;
    NSString * _localName;
    NSString * _queryName;
    id _value;
    NSString * _type;
    NSString * _displayName;
    NSString * _cardinality;
    
}

@property(nonatomic,retain) NSString * identifier;
@property(nonatomic,retain) NSString * localName;
@property(nonatomic,retain) NSString * queryName;
@property(nonatomic,retain) id value;
@property(nonatomic,retain) NSString * type;
@property(nonatomic,retain) NSString * displayName;
@property(nonatomic,retain) NSString * cardinality;

@end
