//
//  TestView.m
//  ReactiveCocoaTest
//
//  Created by 冯亮 on 16/6/17.
//  Copyright © 2016年 idage. All rights reserved.
//

#import "TestView.h"

@implementation TestView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self doDelegate];
}


- (RACSubject *)delegateSignal
{
    if (_delegateSignal == nil) {
        _delegateSignal = [RACSubject subject];
    }
    return _delegateSignal;
}

-(void)doDelegate{
    NSLog(@"--doDelegate--");
    [self.delegateSignal sendNext:@"触发代理了"];

}
@end
