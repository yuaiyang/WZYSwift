//
//  OCViewController.m
//  WZYSwift
//
//  Created by ylcf on 17/1/9.
//  Copyright © 2017年 wzy. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()
@property (nonatomic, copy)void (^completionBlock)();
@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 最简单block
    void (^block)() = ^{
        NSLog(@"OC最简单block");
    };
    block();
    
    // 调用一个没有返回值的block
    [self demo:^{
        NSLog(@"%@",self.view);
    }];
    
    // 解除block循环引用 1
//    [self demo1:^{
//        NSLog(@"%@",self.view);
//    }];
    
    
    __weak typeof(self)weakSelf = self;
    [self demo1:^{
        NSLog(@"%@",weakSelf.view);
    }];
    // 解除block循环引用 2 __unsafe_unretained引用对象都是assign
    __unsafe_unretained typeof(self)weakSelf1 = self;
    [self demo1:^{
        NSLog(@"%@",weakSelf1.view);
    }];
    
}

// 定义一个没有返回值的block
- (void)demo:(void(^)())completion {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作");
        dispatch_async(dispatch_get_main_queue(), ^{
//            执行block
            completion();
        });
        
    });
}

- (void)demo1:(void(^)())completion {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作");
        // 属性记录block
        self.completionBlock = completion;
        dispatch_async(dispatch_get_main_queue(), ^{
            //            执行block
            completion();
        });
        
    });
}

- (void)demo2:(void(^)())completion {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作");
        // 属性记录block
        self.completionBlock = completion;
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            //            执行block
            completion();
        });
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 1.所谓链式编程就是 可以 一直 . . . 调用方法
 2.
*/

@end
