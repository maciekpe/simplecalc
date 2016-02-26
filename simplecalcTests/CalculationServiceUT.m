#import <XCTest/XCTest.h>

#import "CalculationService.h"
#import "CalculationData.h"

@interface CalculationServiceUT : XCTestCase

@end

@implementation CalculationServiceUT

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAdd {
    CalculationService *service = [CalculationService getInstance];
    NSDecimalNumber *result = [service perfomOperation:ADD with: [NSDecimalNumber decimalNumberWithString:@"1"] and:[NSDecimalNumber zero]];
    XCTAssertEqualObjects(result, [NSDecimalNumber decimalNumberWithString:@"1"]);
}

- (void)testSub {
    CalculationService *service = [CalculationService getInstance];
    NSDecimalNumber *result = [service perfomOperation:SUB with: [NSDecimalNumber decimalNumberWithString:@"10"] and:[NSDecimalNumber decimalNumberWithString:@"7"] ];
    XCTAssertEqualObjects(result, [NSDecimalNumber decimalNumberWithString:@"3"]);
}

- (void)testMulti {
    CalculationService *service = [CalculationService getInstance];
    NSDecimalNumber *result = [service perfomOperation:MULTI with: [NSDecimalNumber decimalNumberWithString:@"10"] and:[NSDecimalNumber decimalNumberWithString:@"7"] ];
    XCTAssertEqualObjects(result, [NSDecimalNumber decimalNumberWithString:@"70"]);
}

- (void)testDiv {
    CalculationService *service = [CalculationService getInstance];
    NSDecimalNumber *result = [service perfomOperation:DIV with: [NSDecimalNumber decimalNumberWithString:@"10"] and:[NSDecimalNumber decimalNumberWithString:@"2"] ];
    XCTAssertEqualObjects(result, [NSDecimalNumber decimalNumberWithString:@"5"]);
}

- (void)testNil {
    CalculationService *service = [CalculationService getInstance];
    NSDecimalNumber *result = [service perfomOperation:DIV with: nil and: nil ];
    XCTAssertEqualObjects(result, [NSDecimalNumber zero]);
}

- (void)testZeroDivNumber {
    CalculationService *service = [CalculationService getInstance];
    NSDecimalNumber *result = [service perfomOperation:DIV with: [NSDecimalNumber zero] and: [NSDecimalNumber decimalNumberWithString:@"10"]];
    XCTAssertEqualObjects(result, [NSDecimalNumber zero]);
}

- (void)testNumberDivZero {
    CalculationService *service = [CalculationService getInstance];
    NSDecimalNumber *result = [service perfomOperation:DIV with: [NSDecimalNumber decimalNumberWithString:@"10"] and: [NSDecimalNumber zero]];
    XCTAssertEqualObjects(result, [NSDecimalNumber zero]);
}


@end
