#import "CalculationData.h"

@implementation CalculationData

- (instancetype)init {
    self = [super init];
    if (self) {
        _resultValue = [NSDecimalNumber zero];
        _currentOperation = NONE;
    }
    return self;
}

@end



