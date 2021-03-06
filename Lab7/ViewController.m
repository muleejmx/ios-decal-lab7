//
//  ViewController.m
//  Lab7
//
//  Created by Akilesh Bapu on 4/16/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *calculationView;
@property CalculatorBrain *Cbrain;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _Cbrain = [[CalculatorBrain alloc] init];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updatecalculationView {
    [_calculationView setText:[_Cbrain calculationString]];
}

float currnumber;
float result;

- (IBAction)numberPressed:(id)sender {
    UIButton *pressedButton = (UIButton *)sender;
    currnumber = currnumber *10 + (float)[sender tag] - (float)[sender tag];
    _Cbrain.calculationString = [NSString stringWithFormat:@"%.0f", currnumber];
    [_Cbrain updateCalculationStringFromButtonTag:(int)pressedButton.tag];
    [self updatecalculationView];
}
- (IBAction)clearPressed:(id)sender {
    currnumber = 0.0;
    _Cbrain.calculationString = [NSString stringWithFormat:@"%.1f", 0.0];
    [_Cbrain clearCalculationString];
    [self updatecalculationView];
}
- (IBAction)plusMinusPressed:(id)sender {
    
    [_Cbrain negateCalculationString];
    [self updatecalculationView];
}

- (IBAction)tangent:(id)sender {
    [_Cbrain tangentCalculationString];
    [self updatecalculationView];
}
- (IBAction)actionPressed:(id)sender {
    UIButton *pressedButton = (UIButton *)sender;
    if ([_Cbrain recognizeAction:(int)pressedButton.tag]) {
        [self updatecalculationView];
    };
}

- (IBAction)newMethod:(id)sender {
    [_Cbrain newAction];
    [self updatecalculationView];
    
}

@end
