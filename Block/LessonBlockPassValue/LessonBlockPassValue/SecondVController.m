//
//  SecondVController.m
//  LessonBlockPassValue
//
//  Created by lanouhn on 15/10/10.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import "SecondVController.h"

@interface SecondVController ()

@end

@implementation SecondVController
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.secondBlock) {
        //调用二级页面的block
        self.secondBlock(self.TextField.text);
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
