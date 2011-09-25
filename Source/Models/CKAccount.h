//
//  CKAccount.h
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-15.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kCKAccountTypeAtomPub,
    kCKAccountTypeJSON
} CKAccountType;

@interface CKAccount : NSObject<NSCopying>{
    
    NSString * _baseURL;
    CKAccountType _accountType;
    NSString * _username;
    NSString * _password;
    
}

@property(nonatomic,retain) NSString * baseURL;
@property(nonatomic,assign) CKAccountType accountType;
@property(nonatomic,retain) NSString * username;
@property(nonatomic,retain) NSString * password;

@end
