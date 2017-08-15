//
//  Person.h
//  LessonBlock
//
//  Created by lanouhn on 15/9/25.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
///年纪
@property (nonatomic, assign) int age;
///personBlock
//重点:如果修饰block需要用到copy关键字
@property (nonatomic, copy) void(^personBlock)();
@end
