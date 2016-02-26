#import <Foundation/Foundation.h>
#import "CalculationData.h"


@interface CalculationService : NSObject

+ (instancetype) getInstance;

- (NSDecimalNumber*) perfomOperation:(enum OperationType) operation with: (NSDecimalNumber*) valueOne and: (NSDecimalNumber*) valueTwo ;

@end
