//
//  UIView+MLHeight.m
//  MLEstimatedViewHeight
//
//  Created by Mars on 2019/3/20.
//  Copyright © 2019 Mars. All rights reserved.
//

#import "UIView+MLHeight.h"
#import "MLEstimatedViewHeight.h"
#import <objc/runtime.h>

@implementation UIView (MLHeight)

- (float)mlHeight{
    MLEstimatedViewHeight *estimatedViewHeight = [MLEstimatedViewHeight shareInstance];
    estimatedViewHeight.estimatedView = self;
    
    return estimatedViewHeight.mlHeight;
}

- (void)mlHeightBlock:(void (^)(float mlHeight))mlHeightBlock{
    MLEstimatedViewHeight *estimatedViewHeight = [MLEstimatedViewHeight shareInstance];
    estimatedViewHeight.estimatedView = self;
    [estimatedViewHeight mlHeightBlock:mlHeightBlock];
}

@end
