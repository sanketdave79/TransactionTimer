//
//  SDViewController.h
//  TransactionTimer
//
//  Created by sanket on 13/02/2014.
//  Copyright (c) 2014 Techmentation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SDViewController : UIViewController<UITextFieldDelegate>
 {
    NSDate *start;
    NSDate *end;
     NSDateFormatter *dateFormatter;
     
}
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *codefieldButton;
@property (weak, nonatomic) IBOutlet UITextField *codefieldTextField;

-(IBAction)TransactionStoppervalue;
- (void) startTimer;
- (void) stopTimer;

-(IBAction) start;
- (double) timeElapsedInSeconds;
- (double) timeElapsedInMilliseconds;
- (double) timeElapsedInMinutes;
-(void)targetMethod:(id)sender;

@end

