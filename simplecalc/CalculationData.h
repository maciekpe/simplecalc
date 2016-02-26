#import <Foundation/Foundation.h>

@interface CalculationData : NSObject

@property (nonatomic, strong, readwrite) NSDecimalNumber *resultValue;
@property (nonatomic, assign, readwrite) enum OperationType currentOperation;

enum OperationType {
    ADD = 1,
    SUB = 2,
    MULTI = 3,
    DIV = 4,
    NONE = 0
};

@end
