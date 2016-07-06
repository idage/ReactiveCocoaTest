//
//  TestView.h
//  ReactiveCocoaTest
//
//  Created by 冯亮 on 16/6/17.
//  Copyright © 2016年 idage. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ReactiveCocoa.h"


@interface TestView : UIView

@property (nonatomic, strong) RACSubject *delegateSignal;

@end
