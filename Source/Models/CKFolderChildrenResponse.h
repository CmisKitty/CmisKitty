//
//  CKFolderChildrenResponse.h
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

@interface CKFolderChildrenResponse : NSObject{
    
    
    BOOL _hasMoreItems;
    NSNumber * _numItems;
    NSArray * _objects;
    
}

@property(nonatomic,assign) BOOL hasMoreItems;
@property(nonatomic,retain) NSNumber * numItems;
@property(nonatomic,retain) NSArray * objects;

@end
