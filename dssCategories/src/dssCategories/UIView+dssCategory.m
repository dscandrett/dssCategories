//
//  UIView+dssCategory.m
//
//  The MIT License (MIT)
//
//  Copyright (c) 2008-20015 Doug Scandrett
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

#import "UIView+dssCategory.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (dssCategory)

+ (UIView *)dss_uiViewFromNibName:(NSString *)name owner:(id)anOwner {
    
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:name 
                                                      owner:anOwner
                                                    options:nil];
    
    UIView* myView = (UIView *)[nibViews objectAtIndex:0];
    
    return myView;
}

+ (UITableViewCell *)dss_uiTableViewCellFromNibName:(NSString *)name owner:(id)anOwner {
    return (UITableViewCell *)[UIView dss_uiViewFromNibName:name owner:anOwner];
}

+ (CAKeyframeAnimation *)dss_bubbleAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale0 = CATransform3DMakeScale(0.2f, 0.2f, 1.0f);
    CATransform3D scale1 = CATransform3DMakeScale(0.5f, 0.5f, 1.0f);
    CATransform3D scale2 = CATransform3DMakeScale(1.2f, 1.2f, 1.0f);
    CATransform3D scale3 = CATransform3DMakeScale(0.9f, 0.9f, 1.0f);
    CATransform3D scale4 = CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
    
    NSArray *frameValues = @[[NSValue valueWithCATransform3D:scale0],
                             [NSValue valueWithCATransform3D:scale1],
                             [NSValue valueWithCATransform3D:scale2],
                             [NSValue valueWithCATransform3D:scale3],
                             [NSValue valueWithCATransform3D:scale4]];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           @0.1,
                           @0.0,
                           @0.5,
                           @0.9,
                           @1.0,
                           nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.duration = .3;
    
    return animation;
}

@end
