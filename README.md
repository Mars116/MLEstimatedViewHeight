# MLEstimatedViewHeight

[![CI Status](https://img.shields.io/travis/Mars/MLEstimatedViewHeight.svg?style=flat)](https://travis-ci.org/Mars/MLEstimatedViewHeight)
[![Version](https://img.shields.io/cocoapods/v/MLEstimatedViewHeight.svg?style=flat)](https://cocoapods.org/pods/MLEstimatedViewHeight)
[![License](https://img.shields.io/cocoapods/l/MLEstimatedViewHeight.svg?style=flat)](https://cocoapods.org/pods/MLEstimatedViewHeight)
[![Platform](https://img.shields.io/cocoapods/p/MLEstimatedViewHeight.svg?style=flat)](https://cocoapods.org/pods/MLEstimatedViewHeight)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

This library requires `iOS 8.0+`

## Installation

MLEstimatedViewHeight is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MLEstimatedViewHeight'
```

#

![演示](https://github.com/Mars116/MLEstimatedViewHeight/blob/master/ShowMLEstimatedViewHeight.gif)

#

## How To Use

```objective-c
#import <MLEstimatedViewHeight/UIView+MLHeight.h>

//Calculate view height immediately
1、self.testView.mlHeight;

//Complex view height calculation(Time-consuming operation)
2、[self.testView mlHeightBlock:^(float mlHeight) {

}];
```


中文介绍
==============

MLEstimatedViewHeight 是基于约束和scrollview来计算视图高度的工具。

## 如何使用

```objective-c
#import <MLEstimatedViewHeight/UIView+MLHeight.h>

//立即计算视图高度
1、self.testView.mlHeight;

//复杂视图高度计算(耗时操作)
2、[self.testView mlHeightBlock:^(float mlHeight) {

}];
```


## Author

Mars, 296405485@qq.com

## License

MLEstimatedViewHeight is available under the MIT license. See the LICENSE file for more info.
