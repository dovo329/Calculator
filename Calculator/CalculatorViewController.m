//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Douglas Voss on 3/28/15.
//  Copyright (c) 2015 Doug. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calcDisplay;
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UIButton *buttonZero;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMinus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMultiply;
@property (weak, nonatomic) IBOutlet UIButton *buttonDivide;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonEval;

@property (nonatomic) float arg;
@property (nonatomic) float accum;
@property (nonatomic) NSInteger lastOpcode;
@property (nonatomic) bool lastEval;

@end

@implementation CalculatorViewController


- (IBAction)handleButtonOne:(id)sender
{
    self.arg *= 10;
    self.arg += 1;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonTwo:(id)sender
{
    self.arg *= 10;
    self.arg += 2;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonThree:(id)sender
{
    self.arg *= 10;
    self.arg += 3;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonFour:(id)sender
{
    self.arg *= 10;
    self.arg += 4;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonFive:(id)sender
{
    self.arg *= 10;
    self.arg += 5;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonSix:(id)sender
{
    self.arg *= 10;
    self.arg += 6;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonSeven:(id)sender
{
    self.arg *= 10;
    self.arg += 7;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonEight:(id)sender
{
    self.arg *= 10;
    self.arg += 8;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonNine:(id)sender
{
    self.arg *= 10;
    self.arg += 9;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonZero:(id)sender
{
    self.arg *= 10;
    self.arg += 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
}

- (IBAction)handleButtonClear:(id)sender
{
    self.arg = 0;
    self.accum = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.arg];
    self.lastOpcode = 0;
    self.lastEval = false;
}

- (IBAction)handleButtonEval:(id)sender
{
    [self doEval];
}


- (void) doEval
{
    switch (self.lastOpcode) {
        case 0: // clear entry
            self.accum = self.arg;
            self.arg = 0;
            break;
            
        case 1: // add
            self.accum += self.arg;
            break;
            
        case 2: // subtract
            self.accum -= self.arg;
            break;
            
        case 3: // multiply
            self.accum *= self.arg;
            break;
            
        case 4: // divide
            self.accum /= self.arg;
            break;
            
        default:
            NSLog(@"Invalid lastOpcode!");
            break;
    }
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.accum];
    self.lastEval = true;
}


- (IBAction)handleButtonPlus:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.accum];
    self.lastOpcode = 1;
    self.lastEval = false;
}

- (IBAction)handleButtonMinus:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.accum];
    self.lastOpcode = 2;
    self.lastEval = false;
}

- (IBAction)handleButtonMultiply:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.accum];
    self.lastOpcode = 3;
    self.lastEval = false;
}

- (IBAction)handleButtonDivide:(id)sender
{
    if (self.lastOpcode==0) {
        self.accum = self.arg;
    } else if (!self.lastEval) {
        [self doEval];
    }
    self.arg = 0;
    self.calcDisplay.text = [NSString stringWithFormat:@"%f", self.accum];
    self.lastOpcode = 4;
    self.lastEval = false;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.calcDisplay.text=@"Initial";
    }
    return self;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
