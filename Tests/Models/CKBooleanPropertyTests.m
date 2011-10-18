//
//  CKBooleanPropertyTests.m
//  CmisKitty
//
//  Created by Björn Jonsson on 2011-10-11.
//  Copyright 2011 CmisKitty. All rights reserved.
//

#import "CKBooleanPropertyTests.h"


@implementation CKBooleanPropertyTests

@synthesize property;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    property = [[CKBooleanProperty alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    [property release];
    [super tearDown];
}

- (void)testValue {
    
    STAssertNil(property.value, @"value should be nil");
    STAssertNoThrow(property.value = [NSNumber numberWithInt:1], @"should not fail when setting value to 1"); 
    STAssertEquals(1, [property.value intValue], @"value should be 1"); 
    STAssertNoThrow(property.value = [NSNumber numberWithInt:0], @"should not fail when setting value to 0"); 
    STAssertEquals(0, [property.value intValue], @"value should be 0"); 
    
}

- (void)testBooleanValue {
    
    STAssertFalse(property.booleanValue, @"boolean value should be false");
    property.value = [NSNumber numberWithInt:1]; 
    STAssertTrue(property.booleanValue, @"boolean value should be true");
    property.value = [NSNumber numberWithInt:0]; 
    STAssertEquals(0, [property.value intValue], @"value should be 0");
    STAssertFalse(property.booleanValue, @"boolean value should be false");
    
    property.booleanValue = YES;
    STAssertTrue(property.booleanValue, @"boolean value should be true");
    STAssertEquals(1, [property.value intValue], @"value should be 0");
    property.booleanValue = NO;
    STAssertFalse(property.booleanValue, @"boolean value should be false");
    STAssertEquals(0, [property.value intValue], @"value should be 0");
}

- (void)testDisplayValue {
    
    STAssertEqualObjects(@"No", property.displayValue, @"display value should be NO");
    property.booleanValue = YES;
    STAssertEqualObjects(@"Yes", property.displayValue, @"display value should be YES");
    property.booleanValue = NO;
    STAssertEqualObjects(@"No", property.displayValue, @"display value should be NO");
}


@end
