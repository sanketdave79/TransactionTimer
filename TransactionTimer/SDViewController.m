//
//  SDViewController.m
//  TransactionTimer
//
//  Created by sanket on 13/02/2014.
//  Copyright (c) 2014 Techmentation. All rights reserved.
//

#import "SDViewController.h"

@interface SDViewController () {
    BOOL isTimerActive;
    int counter;
    NSTimer *timer;
    NSString *codefield;
}

@end

@implementation SDViewController




- (id) init {
    self = [super init];
    if (self != nil) {
        start = nil;
        end = nil;
    }
    return self;
}

- (void) startTimer {
    start = [NSDate date];
}

- (void) stopTimer {
    end = [NSDate date];
}

- (double) timeElapsedInSeconds {
    return [end timeIntervalSinceDate:start];
}

- (double) timeElapsedInMilliseconds {
    return [self timeElapsedInSeconds] * 1000.0f;
}

- (double) timeElapsedInMinutes {
    return [self timeElapsedInSeconds] / 60.0f;
}

-(IBAction)TransactionStoppervalue
{
    
    if ([self.codefieldTextField.text isEqualToString:@"ABCD" ]) {
        [self.codefieldTextField resignFirstResponder];
       
        self.timerLabel.text = [NSString stringWithFormat:@"Transaction Stopped !! "];
        [timer invalidate];
        isTimerActive = NO;
        counter = 10;
        return;
    }
    
    else
    {
         [self.codefieldTextField resignFirstResponder];
        return;
        
    }
}

-(void)targetMethod:(id)sender
{
   
//    NSString *currentTime = [dateFormatter stringFromDate: [NSDate date]];
    
    
//    counter--;
    
    
    if (counter == 0) {
        self.timerLabel.text = [NSString stringWithFormat:@"Done babe"];

        [timer invalidate];
        isTimerActive = NO;
        counter = 60;
        return;
    }
    
    self.timerLabel.text = [NSString stringWithFormat:@"%d", counter--];
    
    
    
}

-(IBAction)start
{
    //    [dateFormatter setTimeStyle: NSDateFormatterFullStyle];
    
    if (!isTimerActive) {
       timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(targetMethod:)
                                       userInfo:nil
                                        repeats:YES];
        isTimerActive = YES;
    }


    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"ss"];

//     SDViewController *timer = [[SDViewController alloc] init];
    
    counter = 60;
    
    [self startTimer];
    // Do some work
    [self stopTimer];
    
    
    
    NSLog(@"Total time was: %lf milliseconds", [self timeElapsedInMilliseconds]);
    NSLog(@"Total time was: %lf seconds", [self timeElapsedInSeconds]);
    NSLog(@"Total time was: %lf minutes", [self timeElapsedInMinutes]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
