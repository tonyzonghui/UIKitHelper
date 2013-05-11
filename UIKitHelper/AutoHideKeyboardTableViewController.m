//
//  AutoHideKeyboardTableViewController.m
//  TestAutoHideKeyboardViewController
//
//  Created by Zhang Zonghui on 11/5/13.
//  Copyright (c) 2013 PhoneSoul. All rights reserved.
//

#import "AutoHideKeyboardTableViewController.h"

@interface AutoHideKeyboardTableViewController () <UIGestureRecognizerDelegate, UITextFieldDelegate, UITextViewDelegate>

- (void)viewBackgroundTapped:(UITapGestureRecognizer *)tapGestureRecognizer;

@end

@implementation AutoHideKeyboardTableViewController {
    UITextField *_activeTextField;
    UITextView *_activeTextView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewBackgroundTapped:)];
    tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapGestureRecognizer];
}


#pragma mark - UITextFieldDelegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _activeTextField = nil;
}


#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _activeTextView = textView;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    _activeTextView = nil;
}


#pragma mark - GestureRecognizerDelegate methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ( [touch.view isKindOfClass:[UIControl class]] )
    {
        return NO;
    }
    
    return YES;
}


#pragma mark - Private methods

- (void)viewBackgroundTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    if ( _activeTextField )
    {
        [_activeTextField resignFirstResponder];
    }
    
    if ( _activeTextView )
    {
        [_activeTextView resignFirstResponder];
    }
}


@end
