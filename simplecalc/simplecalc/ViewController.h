#import <UIKit/UIKit.h>
#import "CalculationService.h"
#import "CalculationData.h"

@interface ViewController : UIViewController
@property (nonatomic, strong, readwrite) CalculationService* service;
@property (nonatomic, strong, readwrite) NSString* resultLabelText;
@property (nonatomic, assign, readwrite) BOOL skipValue;
@property (nonatomic, assign, readwrite) BOOL skipOperation;
@property (nonatomic, strong, readwrite) CalculationData* calculationData;
@end

