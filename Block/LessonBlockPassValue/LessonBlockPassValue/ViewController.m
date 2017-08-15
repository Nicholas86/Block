//
//  ViewController.m
//  LessonBlockPassValue
//
//  Created by lanouhn on 15/10/10.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import "ViewController.h"
#import "SecondVController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //为了防止循环引用导致内存泄露,我们在ARC下使用__weak.在MRC下使用__block修饰当前对象
    __weak ViewController *weakSelf = self;
    //button跳转
    SecondVController *secondVC = [segue destinationViewController];
    secondVC.secondBlock = ^(NSString *mm) {
        weakSelf.Label.text = mm;
    };
 
}
@end
