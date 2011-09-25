//
//  CKAccountManager.h
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-15.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
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
