//
//  UIView+MLHeight.h
//  MLEstimatedViewHeight
//
//  Created by Mars on 2019/3/20.
//  Copyright © 2019 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 MLEstimatedViewHeight provides two ways to get the height of the view constraint.
 
 *You can get it directly through the mlHeight property, This way you can calculate the height immediately.
 *Or get it through mlHeightBlock, This method is used to asynchronously calculate more complex views for improved performance.
 
 */

@interface UIView (MLHeight)

@property (nonatomic, assign, readonly) float mlHeight;

- (void)mlHeightBlock:(void (^)(float mlHeight))mlHeightBlock;

@end

NS_ASSUME_NONNULL_END
