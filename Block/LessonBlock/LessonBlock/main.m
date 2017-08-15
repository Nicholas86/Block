//
//  main.m
//  LessonBlock
//
//  Created by lanouhn on 15/9/25.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //block的认识
        //一个简单的block
        //当我们在block内部调用一个局部变量,当改变这个局部变量的值是没有办法影响到block内部的值的,因为底层的block实现,是传入block中一个常量值
        //当我们调用一个静态变量,全局变量,__block修饰的变量,我们在block调用之前修改这个变量的值,会影响到block中这些常量的值,因为block的底层实现是传入的这个值的指针地址
        /*
        static int a = 10;
        void (^myBlock)() = ^{
            NSLog(@"28班帅哥美女们,早上好");
            NSLog(@"ok");
            NSLog(@"%d", a);
        };
        a = 20;
        //block的调用
        myBlock();
        
        //block的内存管理
        //1.NSGlobalBlock:(默认存储位置)全局区block
        //当我们不在block中引入局部变量,或者我们引入的是静态变量和全局变量,那么我们创建的block是在全局静态区的(不用我们管理内存,系统管理,在程序停止运行后回收资源)
        //__NSStackBlock__:栈区Block,也就是说当该block在我们的栈区存储,当我们在block内部引入了局部变量(基础类型,对象类型)那么此时的block存在于栈区,(不用我们管理,这个block,出了该函数就会被销毁)
        
        //NSMallocBlock:堆区Block
        //3.1当我们对于栈区的block进行copy操作的时候,此时的block存在于堆区,这个copy的操作的作用就是:把我们栈区的block拷贝到堆区
        
        int a = 5;
        void(^myBlock2)() = ^ {
            NSLog(@"a = %d", a);
        };
        NSLog(@"myBlock2:%@", [myBlock2 copy]);
        myBlock2();
      
        
        //内存管理
        //当把栈区的block拷贝到堆区,会对内部调用的对象引用计数加1,因此会引发内存问题.
        //解决方案:1:对该对象用__block进行修饰,告诉系统,不对该对象的引用计数加1
        //2:Block_release()方法对该block进行release.在block释放的时候,会自动对所调用的对象进行引用计数减1
        Person *aPerson = [[Person alloc] init];
        aPerson.age = 14;
        void (^mainBlock)() = ^{
            NSLog(@"%d", aPerson.age);
        };
        NSLog(@"%@", mainBlock);
        
        //拷贝到我们堆区
        //拷贝Block_copy
        void(^tempBlock)() = Block_copy(mainBlock);
        tempBlock();
        //移除person
        [aPerson release];
        //Block_release(tempBlock);

        */
        
        //循环引用
        Person *secPerson = [[Person alloc] init];
        [secPerson release];
        
        
        
        
        
    }
    return 0;
}
