//
//  Person.m
//  LessonBlock
//
//  Created by lanouhn on 15/9/25.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    __block Person *weakSelf = self;
    if (self) {
        [self setPersonBlock:^{
            NSLog(@"%d", weakSelf.age);
        }];
       
    }
    _personBlock();
    NSLog(@"%@", _personBlock);
    return self;
}

//1.当在block中调用了self.age,此时block位于栈区,
//2.当我们使用该block中会调用属性的copy操作,此时block位于堆区
//3.此时当前对象引用计数会加1,导致person的引用计数为2
//4.此时在main.m中release,当前对象不会被销毁
//5.位于堆区的block也没有办法执行的dealloc中的release方法,因此引用计数也为1
//6.双方的计数不为0内存没有办法回收,导致循环引用,内存泄露
//解决办法MRC下使用__block修饰 ARC下使用__weak;

- (void)eatMoonCake {
    NSLog(@"进食吧");
}
- (void)dealloc {
    NSLog(@"这个人扑街");
    Block_release(_personBlock);
    [super dealloc];
}
@end
