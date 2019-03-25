//
//  MLEstimatedViewHeight.h
//  MLEstimatedViewHeight
//
//  Created by Mars on 2019/3/18.
//  Copyright © 2019 Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 The MLEstimatedViewHeight class is based on constraints and scrollview to calculate the height of the view.
 See UIView+MLHeight.h for more convenience methods to set the attributes.
 */
@interface MLEstimatedViewHeight : NSObject

@property (nonatomic, strong)       UIView *estimatedView;
@property (nonatomic, readonly)     float mlHeight;

+ (instancetype) shareInstance;

- (void)mlHeightBlock:(void (^)(float mlHeight))mlHeightBlock;

@end

NS_ASSUME_NONNULL_END
