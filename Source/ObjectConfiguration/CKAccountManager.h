//
//  CKAccountManager.h
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-15.
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
#import "CKAccount.h"

@interface CKAccountManager : NSObject{
    
    CKAccount * _account;
    RKObjectManager * _objectManager;
    
}

@property(nonatomic,retain) CKAccount * account;

+(CKAccountManager *)managerForAccount:(CKAccount *)account;
+(CKAccountManager *)activeManager;
+(void)setActiveManager:(CKAccountManager *) manager;

-(RKObjectManager *)objectManager;

-(void)setup;

@end
