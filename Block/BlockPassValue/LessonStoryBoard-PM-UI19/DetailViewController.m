//
//  DetailViewController.m
//  LessonStoryBoard-PM-UI19
//
//  Created by lanouhn on 15/9/24.
//  Copyright (c) 2015年 梅消寒. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTF;//姓名输入框

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //接收上一界面传过来的值
    self.nameTF.text = self.receivedStr;
    
    // Do any additional setup after loading the view.
}
//block传值
- (void)showTextFieldTextBlock:(void (^)(NSString *))block {
    self.block = block;
}
//视图将要消失时，将输入框内的值通过block传到上一界面
#warning message -- 接收传值
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.block != nil) {
        NSLog(@"1");
        //传值
        self.block(self.nameTF.text);
        NSLog(@"%@",self.nameTF.text);
    }
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
