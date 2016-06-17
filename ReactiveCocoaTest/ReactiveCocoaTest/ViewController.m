//
//  ViewController.m
//  ReactiveCocoaTest
//
//  Created by 冯亮 on 16/6/17.
//  Copyright © 2016年 idage. All rights reserved.
//

#import "ViewController.h"
#import "RACSignal.h"
#import "RACDisposable.h"
#import "UIControl+RACSignalSupport.h"
#import "TestView.h"
#import "ReactiveCocoa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //例子1 系统控件 触发动作
     UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   
    [button setFrame:CGRectMake(100, 100, 100, 40)];
    
    [button setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:button];
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击按钮了");
    }];
    
    //例子2 自定义视图 替换代理
    TestView *testView = [[TestView alloc]initWithFrame:CGRectMake(100, 160, 100, 40)];
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
    
    [[testView rac_signalForSelector:@selector(doDelegate)]subscribeNext:^(id x) {
        NSLog(@"触发自定义视图的代理方法了");

    }];
    //例子3 监听通知事件
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"testNotification" object:nil] subscribeNext:^(id x) {
        NSLog(@"接收到testNotification通知了");
    }];
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSNotification *notification = [NSNotification notificationWithName:@"testNotification" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
