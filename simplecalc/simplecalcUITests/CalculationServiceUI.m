//
//  CalculationServiceUI.m
//  simplecalc
//
//  Created by Maciek on 31.01.2016.
//  Copyright © 2016 mpe. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CalculationServiceUI : XCTestCase

@end

@implementation CalculationServiceUI

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    //[[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMulti {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    sleep(3);
    XCUIElement *button = app.buttons[@"7"];
    [button tap];
    [app.buttons[@"*"] tap];
    [button tap];
    [app.buttons[@"="] tap];
    [app.staticTexts[@"49"] tap];
    [app terminate];
}

- (void)testAdd {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    sleep(3);
    [app.buttons[@"9"] tap];
    [app.buttons[@"+"] tap];
    [app.buttons[@"6"] tap];
    [app.buttons[@"="] tap];
    [app.staticTexts[@"15"] tap];
    [app terminate];
    
    
}

- (void)testSub {
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    sleep(3);
    XCUIElement *button = app.buttons[@"9"];
    [button tap];
    [button tap];
    [app.staticTexts[@"99"] tap];
    [app.buttons[@"-"] tap];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"="] tap];
    [app.staticTexts[@"87"] tap];
    [app terminate];
    
    
}

- (void)testDiv {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    sleep(3);
    XCUIElement *button = app.buttons[@"3"];
    [button tap];
    [button tap];
    [app.staticTexts[@"33"] tap];
    [app.buttons[@"/"] tap];
    [button tap];
    [app.buttons[@"="] tap];
    [app.staticTexts[@"11"] tap];
    [app terminate];
    
}

@end
