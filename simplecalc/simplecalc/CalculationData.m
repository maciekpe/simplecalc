#import "CalculationData.h"

@implementation CalculationData

- (instancetype)init {
    self = [super init];
    if (self) {
        _resultValue = [NSDecimalNumber zero];
        _tempOperation = NONE;
        _tempValue = [NSDecimalNumber zero];
    }
    return self;
}

@end



