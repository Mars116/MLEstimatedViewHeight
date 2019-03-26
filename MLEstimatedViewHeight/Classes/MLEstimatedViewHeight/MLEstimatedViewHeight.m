//
//  MLEstimatedViewHeight.m
//  MLEstimatedViewHeight
//
//  Created by Mars on 2019/3/18.
//  Copyright © 2019 Mars. All rights reserved.
//

#import "MLEstimatedViewHeight.h"

@interface MLEstimatedViewHeight ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *constraints;
@property (nonatomic)         float copyEstimatedViewHeight;

@end

@implementation MLEstimatedViewHeight

static MLEstimatedViewHeight* _instance = nil;

//Single
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
        _instance.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _instance.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _instance.constraints = [NSMutableArray array];
    }) ;
    return _instance ;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [MLEstimatedViewHeight shareInstance] ;
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return [MLEstimatedViewHeight shareInstance] ;
}

- (void)calculateHeight:(void (^)(float mlHeight))mlHeightBlock{
    //Remove Constraints
    for (NSArray *constraints in self.constraints) {
        [self.scrollView removeConstraints:constraints];
    }
    
    //Copy EstimatedView
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *copyEstimatedView = [self copyEstimatedView:self.estimatedView];
    self.copyEstimatedViewHeight = copyEstimatedView.frame.size.height;
    [self.scrollView addSubview:copyEstimatedView];
    
    //Add Constraints
    NSDictionary *views =  NSDictionaryOfVariableBindings(copyEstimatedView);
    NSDictionary *metrics = @{@"padding":@0, @"copyEstimatedViewWidth":@(copyEstimatedView.frame.size.width)};
    NSArray *hEstimatedViewPaddingConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[copyEstimatedView]" options:NSLayoutFormatAlignAllTop metrics:metrics views:views];
    NSArray *hEstimatedViewWidth = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[copyEstimatedView(copyEstimatedViewWidth)]" options:NSLayoutFormatAlignAllTop metrics:metrics views:views];
    NSArray *vEstimatedViewPadding = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[copyEstimatedView]-padding-|" options:NSLayoutFormatAlignAllLeft metrics:metrics views:views];
    [self.scrollView addConstraints:hEstimatedViewPaddingConstraints];
    [self.scrollView addConstraints:vEstimatedViewPadding];
    [copyEstimatedView addConstraints:hEstimatedViewWidth];
    
    [self.constraints addObject:hEstimatedViewPaddingConstraints];
    [self.constraints addObject:vEstimatedViewPadding];
    [self.constraints addObject:hEstimatedViewWidth];
    
    if (mlHeightBlock) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [copyEstimatedView layoutIfNeeded];
            [self.scrollView layoutIfNeeded];
            self->_mlHeight = [self setMlHeight:copyEstimatedView.frame.size.height];
            mlHeightBlock(self->_mlHeight);
        });
    }else{
        [copyEstimatedView layoutIfNeeded];
        [self.scrollView layoutIfNeeded];
        _mlHeight = [self setMlHeight:copyEstimatedView.frame.size.height];
    }
}

- (void)setEstimatedView:(UIView *)estimatedView{
     @synchronized(self) {
         _estimatedView = estimatedView;
         [self calculateHeight:nil];
     }
}

- (float)setMlHeight:(float)estimatedHeight{
    if (estimatedHeight == 0) {
        _mlHeight = _copyEstimatedViewHeight;
    }else{
        _mlHeight = estimatedHeight;
    }
    return _mlHeight;
}

- (void)mlHeightBlock:(void (^)(float mlHeight))mlHeightBlock{
    [self calculateHeight:mlHeightBlock];
}

- (UIView *)copyEstimatedView:(UIView *)view{
    NSData *tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}

@end
