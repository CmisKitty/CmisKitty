//
//  CKDecimalProperty.h
//  CmisKitty
//
//  Created by Bjorn Jonsson on 2011-10-13.
//  Copyright 2011 CmisKitty. All rights reserved.
//

#import "CKProperty.h"

@interface CKDecimalProperty : CKProperty

@property(nonatomic,retain) NSDecimalNumber * value;

@end
