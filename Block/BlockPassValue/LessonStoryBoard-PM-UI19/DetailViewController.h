//
//  DetailViewController.h
//  LessonStoryBoard-PM-UI19
//
//  Created by lanouhn on 15/9/24.
//  Copyright (c) 2015年 梅消寒. All rights reserved.
//

#import <UIKit/UIKit.h>
#warning message -- 222222222222 定义block
//1.定义一个block，用来传值，参数是要传的值
typedef void(^ReturnBlock)(NSString *str);
//returnBlock等价于(void) (^)(NSString *)
//表示这个函数是个没有返回值，并且带有一个字符串参数的函数(函数的类型)

@interface DetailViewController : UIViewController
//设置一个属性，用来接收上一界面传过来的姓名
@property (nonatomic,strong)NSString *receivedStr;
//创建一个  ReturnBlock类型的block对象，注意block的语义特性关键字为  copy
@property (nonatomic,copy) ReturnBlock block;//2.创建一个ReturnBlock类型的block对象/
//使用copy关键字，表示将这个block拷贝到堆区
//3.设置传值方法，用来block传值---本类的方法只有本类对象可以调用
- (void)showTextFieldTextBlock:(void (^)(NSString *str))block;
@end

