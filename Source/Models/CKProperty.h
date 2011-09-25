//
//  CKProperty.h
//  GoReader
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
