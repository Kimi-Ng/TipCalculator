//
//  TipCalculatorViewController.m
//  TipCalculator
//
//  Created by Cheng-Yuan Wu on 6/11/15.
//  Copyright (c) 2015 Kimi. All rights reserved.
//

#import "TipCalculatorViewController.h"
#import "BackgroundView.h"
//#import "UIBezierPath.h"
@interface TipCalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *billTitle;

@property (weak, nonatomic) IBOutlet UILabel *billPrice;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UILabel *tipPrice;
@property (weak, nonatomic) IBOutlet UILabel *tipTitle;
@property (weak, nonatomic) IBOutlet UILabel *totalTitle;
@property (weak, nonatomic) IBOutlet UITextView *hiddenTextView;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipNode;



@end

@implementation TipCalculatorViewController

float fBillPrice;


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.hiddenTextView setDelegate:self];
    //make keyboard always appear
    
    [self.hiddenTextView becomeFirstResponder];
    self.hiddenTextView.hidden = YES;

    //handle  bill input
    //self.BillPrice.text =

    UIBezierPath *p = [UIBezierPath bezierPath];
    [p moveToPoint:CGPointMake(10.0, 10.0)];
    [p addLineToPoint:CGPointMake(100.0, 100.0)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [p CGPath];
    [shapeLayer setStrokeColor: (__bridge CGColorRef)([UIColor redColor])];
    shapeLayer.lineWidth = 3.0f;
    [shapeLayer setFillColor:(__bridge CGColorRef)([UIColor redColor])];
    [self.backgroundView.layer addSublayer:shapeLayer];
    [self.backgroundView setBackgroundColor:[UIColor purpleColor]];
    fBillPrice = 0;
    
    /**
    NSString *homePath = NSHomeDirectory();
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) objectAtIndex:0];
    NSString *appPath = [[NSBundle mainBundle] bundleIdentifier];
    //e.g.. test.plist
    NSString *devPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"]; //readonly
    */
    
    /**
    * app directory
    *   -xcode resource and source code
    * Documents
    * Library
    *   -Cache
    *   -Preference
    */
    
    //get data from plist in the resource folder (readonly)
//    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *plistPath = [dir stringByAppendingPathComponent:@"MyData.plist"];

    
/***************
 working
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSLog(@"%@", dict[@"testkey"]);
    
    //write plist to the document folder (read/write)
    [dict setObject:@"YOYO" forKey:@"TestKey"];
    NSString *plistDocPath = [docPath stringByAppendingString:@"kimitest.plist"];
    [dict writeToFile:plistDocPath atomically:YES];

    NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] initWithContentsOfFile:plistDocPath];
    NSLog(@"%@", dict2[@"TestKey"]);
    
************/
    
    /*
     NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/MyData.plist"];
    [dict setObject:@"YOYO" forKey:@"TestKey"];
    [dict writeToFile:@"/MyData.plist" atomically:YES];
    */
    /*
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [dir stringByAppendingPathComponent:@"MyData.plist"];
    

    
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager isWritableFileAtPath:plistPath]) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        NSLog(@"%@", dict[@"TestKey"]);
                [dict setObject:@"ALOHA3" forKey:@"TestKey"];
        NSLog(@"%@", dict[@"TestKey"]);
             [dict writeToFile:plistPath atomically:YES];
    }
    else {
                NSLog(@"not exist");
    }
     */
    /*
    if ([manager isReadableFileAtPath:plistPath]) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];

        NSLog(@"%@", dict[@"TestKey"]);
        NSLog(@"%@", dict[@"dollarSign"][@"JPY"]);
        [dict setObject:@"ALOHA" forKey:@"TestKey"];

        NSLog(@"%@", dict[@"TestKey"]);
        [dict writeToFile:plistPath atomically:NO];
//         [dict writeToFile:plistPath atomically:YES encoding:NSUTF8StringEncoding  error:nil];
    }
    else {
        NSLog(@"not readable");
    }
*/

    /*
    NSString *filename = @"MyData.plist";

    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dir = [dir stringByAppendingString:filename];

    */

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSString *)getTipPrice:(float)billPrice tip:(float)tipPercentage
{
    return [self formatPriceStringWithDollarSign:@"$" price:[NSString stringWithFormat:@"%0.2f", (billPrice * tipPercentage)]];
}

- (NSString *)getTotalPrice:(float)billPrice tip:(float)tipPercentage
{
    return [self formatPriceStringWithDollarSign:@"$" price:[NSString stringWithFormat:@"%0.2f", billPrice * (1.0 + tipPercentage)]];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

#pragma - rotate support
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortraitUpsideDown | UIInterfaceOrientationMaskPortrait;
}

- (IBAction)settingBtnAction:(id)sender {
//push settings view
}


//vertical swipe -- clear data

//left swipe
//right swipe

- (NSString *)formatPriceStringWithDollarSign:(NSString *)dollarSign price:(NSString *)price
{
///    [NSString stringWithFormat:@"$%0.2f", price];
//}
    //convert NSString to NSNumber
    NSNumber *priceNumber = @([price intValue]);
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setGroupingSize:3];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];

    [numberFormatter setCurrencySymbol:dollarSign];
    [numberFormatter setCurrencyCode:@"USD"];
    //[numberFormatter setLocale:[NSLocale currentLocale]];
    [numberFormatter setMaximumFractionDigits:2];

    
    return [numberFormatter stringFromNumber:priceNumber];
}

//when enter pressed or line auto-changed would reach here
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //Todo:
    //1) present sound
    NSString *inputStr= [self.hiddenTextView.text stringByAppendingString:text];
    fBillPrice = [inputStr floatValue];
    self.billPrice.text = [self formatPriceStringWithDollarSign:@"$" price:inputStr];
    
    [self.backgroundView setBackgroundColor:[UIColor yellowColor]];
    /*
    if ([text isEqualToString:@"\n"]) {
        //show cat speech image
        self.catSpeechImageView.hidden = NO;
        self.catSpeechText.hidden = NO;
        self.catSpeechText.text = self.textView.text;
        
        NSLog(@"Speak code here...");
        
        // Text to Speech
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.textView.text];
        utterance.rate = 0.3;
        [synthesizer speakUtterance:utterance];
        
        //clear
        [self.textView setText:@""];
    }
    else {
        //hide cat speech image
        self.catSpeechImageView.hidden = YES;
        self.catSpeechText.hidden = YES;
    }
    */
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

/*
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"drawlayer");
    [[UIColor redColor] setStroke];
    for (UIBezierPath *path in self.paths){
        [path stroke];
    }
}
*/


- (IBAction)handleLeftSwipe:(id)sender {
    CGFloat value = self.tipSlider.value;
    value -= 0.05;
    [self.tipSlider setValue:value animated:YES];
    [self updateData];
    [self updateTipNote];
}

- (IBAction)handleRightSwipe:(id)sender {
    CGFloat value = self.tipSlider.value;
    value += 0.05;
    [self.tipSlider setValue:value animated:YES];
    [self updateData];
    [self updateTipNote];
}

- (IBAction)handleUpSwipe:(id)sender {
    [self setUpDefaultView];
    [self.backgroundView setBackgroundColor:[UIColor purpleColor]];
}

- (IBAction)handleDownSwipe:(id)sender {
    [self setUpDefaultView];
    [self.backgroundView setBackgroundColor:[UIColor purpleColor]];
}

- (void)setUpDefaultView
{
    self.hiddenTextView.text = @"";
    self.billPrice.text = [self formatPriceStringWithDollarSign:@"$" price:@"0"];
    self.tipPrice.text = [self formatPriceStringWithDollarSign:@"$" price:@"0"];
    self.totalPrice.text = [self formatPriceStringWithDollarSign:@"$" price:@"0"];
}

- (IBAction)sliderValueChanged:(id)sender {
    [self updateData];
    [self updateTipNote];
    
}

-(void)updateData {
    self.tipPrice.text = [self getTipPrice:fBillPrice tip:self.tipSlider.value];
    self.totalPrice.text = [self getTotalPrice:fBillPrice tip:self.tipSlider.value];
}

-(void)updateTipNote {
    NSString *valueStr = [NSString stringWithFormat:@"%d", (int)(self.tipSlider.value * 100)];
    
    self.tipNode.text = [valueStr stringByAppendingString:@"%"];
    CGRect frame = self.tipNode.frame;
    

    frame.origin.x = self.tipSlider.frame.origin.x + self.tipSlider.frame.size.width * self.tipSlider.value;
    [self.tipNode setFrame: frame];
}

- (IBAction)onTap:(id)sender {
    [self updateData];
}


@end
