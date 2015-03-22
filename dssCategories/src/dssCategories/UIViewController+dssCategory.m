//
//  UIViewController+dssCategory.m
//  
//  The MIT License (MIT)
//
//  Copyright (c) 2008-2015 Doug Scandrett
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "UIViewController+dssCategory.h"
#import <QuartzCore/QuartzCore.h>

#define kLoadingViewTag 987120
#define kAnimTimeInterval .4

@implementation UIViewController (dssCategory)
- (void)dss_showLoadingView {
    
    UIView *view = self.view;
    UIView *test = [view viewWithTag:kLoadingViewTag];
    if (test) {
        return;
    }
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 80.0f)];
    bg.backgroundColor = [UIColor clearColor];
    bg.layer.cornerRadius = 10.0f;
    bg.clipsToBounds = YES;
    bg.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    
    UIView *color = [[UIView alloc] initWithFrame:bg.frame];
    color.backgroundColor = [UIColor blackColor];
    color.alpha = .5f;
    [bg addSubview:color];
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activity startAnimating];
    [bg addSubview:activity];
    activity.center = bg.center;
    
    bg.center = view.center;
    bg.tag = kLoadingViewTag;
    bg.alpha = 0.0f;
    [view addSubview:bg];
    
    [UIView animateWithDuration:kAnimTimeInterval 
                          delay:0 
                        options:(UIViewAnimationOptionCurveEaseIn) 
                     animations:^{
                         bg.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                     }];
}
- (void)dss_hideLoadingView {
    
    UIView *view = self.view;

    UIView *activity = [view viewWithTag:kLoadingViewTag];
    if (activity) {
        [UIView animateWithDuration:kAnimTimeInterval 
                              delay:0 
                            options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState) 
                         animations:^{
                             activity.alpha = 0.0f;
                         } completion:^(BOOL finished) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wselector"
                             [activity performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:kAnimTimeInterval];
#pragma clang diagnostic pop
                         }];
    }
}
- (void)dss_showErrorAlert:(NSError *)err {
    if (err) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Oops!", @"Alert dialog title for an error.")
                                                        message:err.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:NSLocalizedString(@"Okay", @"Button title for alert dialogs"), nil];
        [alert show];
    }
}
@end
