//
//  CKObjectManagerConfigurator.h
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-09-15.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CKObjectManagerConfigurator <NSObject>

-(void)configureObjectManager:(RKObjectManager *) objectManager;

@end
