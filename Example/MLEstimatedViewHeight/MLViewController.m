//
//  MLViewController.m
//  MLEstimatedViewHeight
//
//  Created by Mars on 03/21/2019.
//  Copyright (c) 2019 Mars. All rights reserved.
//

#import "MLViewController.h"
#import <MLEstimatedViewHeight/UIView+MLHeight.h>

@implementation MLViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.textView.text = [NSString stringWithFormat:@"print view1 mlHeight %.2f",self.testView1.mlHeight];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int pageNo= scrollView.contentOffset.x/scrollView.frame.size.width;
    float mlHeight = 0;
    switch (pageNo) {
        case 0:
            mlHeight = self.testView1.mlHeight;
            break;
        case 1:{
            [self.testView2_1 mlHeightBlock:^(float mlHeight) {
                self.textView.text = [NSString stringWithFormat:@"print view2 mlHeight %.2f",mlHeight];
            }];
        }
            break;
        case 2:
            mlHeight = self.testView3.mlHeight;
            break;
        case 3:
            mlHeight = self.testView4.mlHeight;
       
            break;
        default:
            mlHeight = self.testView1.mlHeight;
            break;
    }
    
    if (mlHeight != 0) {
        self.textView.text = [NSString stringWithFormat:@"print view%i mlHeight %.2f",++pageNo, mlHeight];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
