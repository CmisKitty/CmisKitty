//
//  CKAccountManager.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-15.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import "CKAccountManager.h"
#import "CKObjectManagerConfigurator.h"
#import "CKObjectManagerJSONConfigurator.h"

@interface CKAccountManager()

@property(nonatomic,retain) RKObjectManager * objectManager;

@end


static CKAccountManager * activeManager = nil;

@implementation CKAccountManager

@synthesize account = _account;
@synthesize objectManager = _objectManager;

+(NSMutableDictionary *) managers{
    static NSMutableDictionary *dict = NULL;
    if(dict == NULL)
    {
        dict = [[NSMutableDictionary alloc] init];
    }
    return [[dict retain] autorelease];
}

+(CKAccountManager *)managerForAccount:(CKAccount *)account{
    
    NSAssert(account,@"account was nil");
    CKAccountManager * manager = (CKAccountManager *)[[self managers] objectForKey:account];
    
    if (!manager) {
        manager = [[[CKAccountManager alloc] init] autorelease];
        manager.account = account;
        [[self managers] setObject:manager forKey:account];
        
        // set to active account if only one account
        if ([[self managers] count] == 1) {
            [self setActiveManager:manager];
        }
    }
    
    return manager;
    
}

+(CKAccountManager *)activeManager{
    return activeManager;
}

+(void)setActiveManager:(CKAccountManager *)manager{
    
    activeManager = manager;
    if (![[self managers] objectForKey:manager.account]) {
         [[self managers] setObject:manager forKey:manager.account];
    }
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)setup{
    
    // remove old object manager
    [self.objectManager release];
    
    // setup object manager;
    self.objectManager = [[RKObjectManager alloc] initWithBaseURL:self.account.baseURL];
    self.objectManager.client.username = self.account.username;
    self.objectManager.client.password = self.account.password;
    
    id<CKObjectManagerConfigurator> configurator = nil; 
    switch (self.account.accountType) {
        case kCKAccountTypeJSON:
            configurator = [[[CKObjectManagerJSONConfigurator alloc] init] autorelease];
            break;
        case kCKAccountTypeAtomPub:
            NSAssert(NO, @"AtomPub binding is not implemented yet");
            break;    
        default:
            NSAssert1(NO, @"Unknown account type: %d",self.account.accountType);
            break;
    }
    [configurator configureObjectManager:self.objectManager];
    
    
}

@end
