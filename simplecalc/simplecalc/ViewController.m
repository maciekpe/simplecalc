#import "ViewController.h"
#import "CalculationService.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *acBtn;
@property (weak, nonatomic) IBOutlet UIButton *plusMinusBtn;
@property (weak, nonatomic) IBOutlet UIButton *percentageBtn;
@property (weak, nonatomic) IBOutlet UIButton *divBtn;
@property (weak, nonatomic) IBOutlet UIButton *multiBtn;
@property (weak, nonatomic) IBOutlet UIButton *plusBtn;
@property (weak, nonatomic) IBOutlet UIButton *minusBtn;
@property (weak, nonatomic) IBOutlet UIButton *calculateBtn;


@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
@property (weak, nonatomic) IBOutlet UIButton *fiveBtn;
@property (weak, nonatomic) IBOutlet UIButton *sixBtn;
@property (weak, nonatomic) IBOutlet UIButton *sevenBtn;
@property (weak, nonatomic) IBOutlet UIButton *eigthBtn;
@property (weak, nonatomic) IBOutlet UIButton *nineBtn;
@property (weak, nonatomic) IBOutlet UIButton *zeroBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _service = [CalculationService getInstance];
    _calculationData = [[CalculationData alloc] init];
    _skipValue = NO;
    _skipOperation = NO;
    [self updateResultLabelFromCalculationData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)oneTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)twoTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)threeTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)fourTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)fiveTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)sixTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)sevenTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)eightTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)nineTappedAct:(id)sender {
    [self handleDigit: sender];
}

- (IBAction)zeroTappedAct:(id)sender {
    [self handleDigit: sender];
}


- (IBAction)divTappedAct:(id)sender {
    [self handleOperation: DIV];
    [self handleFlagsAfterOperation];
}

- (IBAction)multiTappedAct:(id)sender {
    [self handleOperation: MULTI];
    [self handleFlagsAfterOperation];
}

- (IBAction)plusTappedAct:(id)sender {
    [self handleOperation: ADD];
    [self handleFlagsAfterOperation];
}


- (IBAction)minusTappedAct:(id)sender {
    [self handleOperation: SUB];
    [self handleFlagsAfterOperation];
}

- (void) handleOperation:(enum OperationType) operation {
    if(!self.skipOperation){
        NSDecimalNumber *value = [self getNumberFromResultLabel];
        if(self.calculationData.currentOperation != NONE){
            [self calculate:value];
            [self updateResultLabelFromCalculationData];
        }else{
            [self.calculationData setResultValue:value];
        }
    }
    [self.calculationData setCurrentOperation: operation];
}

- (void) handleFlagsAfterOperation {
    [self setSkipValue: YES];
    [self setSkipOperation: YES];
}

- (NSDecimalNumber*) getNumberFromResultLabel {
    NSString *valueText = [self.resultLabel text];
    return [NSDecimalNumber decimalNumberWithString:valueText];
}


- (IBAction)calculateTappedAct:(id)sender {
    NSDecimalNumber *value = [self getNumberFromResultLabel];
    [self calculate:value];
    [self updateResultLabelFromCalculationData];
}

- (void) calculate:(NSDecimalNumber*) newValue {
    NSDecimalNumber *result = [self.service perfomOperation:self.calculationData.currentOperation with:self.calculationData.resultValue and:newValue];
    [self.calculationData setResultValue: result];
    [self.calculationData setCurrentOperation: NONE];
}

- (void) handleDigit:(id)sender {
    UIButton *resultButton = (UIButton*) sender;
    [self handleLabelText: resultButton.currentTitle];
    [self handleFlagsAfterDigit];
}

- (void) handleLabelText: (NSString*) valuebutton{
    NSString *valueLabel = [self.resultLabel text];
    if(self.skipValue){
        valueLabel = @"";
    }
    valueLabel = [valueLabel stringByAppendingString:valuebutton];
    if ([valueLabel hasPrefix:@"0"] && [valueLabel length] > 1) {
        valueLabel = [valueLabel substringFromIndex:1];
    }
    [self.resultLabel setText: valueLabel];
}

- (void) handleFlagsAfterDigit {
    if(self.skipValue){
        [self setSkipValue : NO];
    }
    if(self.skipOperation){
        [self setSkipOperation: NO];
    }
}

- (void) updateResultLabelFromCalculationData {
    [self.resultLabel setText:[NSString stringWithFormat:@"%@", [self.calculationData resultValue]]];
}


@end
