//
//  CKFolderChildrenResponse.h
//  GoReader
//
//  Created by Björn Jonsson on 2011-09-10.
//  Copyright 2011 Altran Sverige AB. All rights reserved.
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
