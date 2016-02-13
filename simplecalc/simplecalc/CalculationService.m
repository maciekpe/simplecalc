#import "CalculationService.h"
#import "CalculationData.h"

@implementation CalculationService

+ (instancetype) getInstance {
    static CalculationService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self alloc] init];
    });
    return service;
}

- (NSDecimalNumber*) perfomOperation:(enum OperationType) operation with: (NSDecimalNumber*) valueOne and: (NSDecimalNumber*) valueTwo {
    if(valueOne == nil || valueOne == nil){
        return [NSDecimalNumber zero];
    }
    NSDecimalNumber *result = nil;
    switch(operation){
        case ADD:
            result = [self add: valueOne and: valueTwo];
            break;
        case SUB:
            result = [self sub: valueOne and: valueTwo];
            break;
        case MULTI:
            result = [self multi: valueOne and: valueTwo];
            break;
        case DIV:
            result = [self div: valueOne and: valueTwo];
            break;
        default:
            break;
    }
    return result;
}

- (NSDecimalNumber*) add: (NSDecimalNumber*) valueOne and: (NSDecimalNumber*) valueTwo {
    return [valueOne decimalNumberByAdding: valueTwo];
}

- (NSDecimalNumber*) div: (NSDecimalNumber*) valueOne and: (NSDecimalNumber*) valueTwo {
    if([valueTwo isEqualToValue:[NSDecimalNumber zero]]){
        return [NSDecimalNumber zero];
    }
    return [valueOne decimalNumberByDividingBy: valueTwo];
}

- (NSDecimalNumber*) multi: (NSDecimalNumber*) valueOne and: (NSDecimalNumber*) valueTwo {
    return [valueOne decimalNumberByMultiplyingBy: valueTwo];
}

- (NSDecimalNumber*) sub: (NSDecimalNumber*) valueOne and: (NSDecimalNumber*) valueTwo {
    return [valueOne decimalNumberBySubtracting: valueTwo];
}


@end