//
//  ContactViewController.m
//  LessonStoryBoard-PM-UI19
//
//  Created by lanouhn on 15/9/24.
//  Copyright (c) 2015年 梅消寒. All rights reserved.
//

#import "ContactViewController.h"
#import "CustomViewCell.h"
#import "DetailViewController.h"
int c = 10;//定义一个全局变量
@interface ContactViewController ()
@property (nonatomic,strong)NSMutableArray *dataArray;//数组源数组
@property (nonatomic,strong)NSMutableArray *phoneNumberArray;//用来存储电话号码
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    //姓名数组
    self.dataArray = [@[@"大娃",@"二娃",@"三娃",@"四娃",@"五娃",@"六娃",@"七娃",@"小金刚"]mutableCopy];
    self.phoneNumberArray = [@[@"456",@"654",@"45453",@"4414",@"5411",@"021",@"55",@"8964"]mutableCopy];
#warning message -- 111111111.block的注意事项
    //block注意事项
    /*
     在block内部不能修改局部变量,如果想要修改,需要在类型前面加__block修饰;
     但是在block内部可以修改全局变量;
     */

    //练习:定义一个block,用来求两个整数的余数;
        __block int count = 10;
        //将block类型重定义,重新起个名字,lanou
        typedef NSInteger (^lanou)(NSInteger ,NSInteger);
        lanou rem  = ^NSInteger (NSInteger a, NSInteger b){
            return a % b;
        };
        NSInteger rem1 = rem(10,6);
        NSLog(@"rem1 = %ld",rem1);
        
        //练习:定义一个block,用来求两个整数的和;
        lanou sum = ^NSInteger(NSInteger a, NSInteger b) {
            count += 20;
            c += 20;//block可以直接修改全局变量;
            return a + b + count + c;
        };
        NSInteger value = sum (10,8);
        NSLog(@"sum = %ld",value);
        
    

  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cells" forIndexPath:indexPath];
    //为cell上的控件赋值
    cell.nameLabel.text = self.dataArray[indexPath.row];
    cell.phoneNumberLable.text = self.phoneNumberArray[indexPath.row];
    return cell;
}




#pragma mark - Navigation
#warning message -- 3333333333333传值;
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    //得到目的视图控制器   [segue destinationViewController]
    DetailViewController *detailVC = [segue destinationViewController];
    //获取点击的cell对象
    CustomViewCell *cell = sender;
    //通过cell获取cell所在的位置  indexpath
    NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
    detailVC.receivedStr = [self.dataArray objectAtIndex:indexpath.row];
    
    //对象调用方法 需要加中括号，是借助twoDetailVC调用showTextFieldTextBlock:这个方法的时候，会得到一个block参数，那这个参数就是我们对block的实现方法
    //使用block时，block语法块里所使用到（持有）的对象，引用计数会+1，会造成循环引用问题，避免循环引用的方法如下：
    //MRC下：使用__block修饰所使用过的对象，解决循环引用问题，不会造成引用计数+1；
    //ARC下：使用__weak修饰所使用过的对象，解决循环引用问题，不会造成引用计数+1；
    __weak CustomViewCell *twoCell = cell;
    __weak DetailViewController *twoDetailVC = detailVC;
    /**
     *  block属性传值
     */
//    twoDetailVC.block = ^(NSString *str) {
//        NSLog(@"接收");
//        //将接收到的值显示在cell的nameLable上
//        twoCell.nameLabel.text = str;
//        NSLog(@"str = %@",str);
//        NSLog(@"twoCell.nameLabel.text = %@",twoCell.nameLabel.text);
//        twoDetailVC.view.backgroundColor = [UIColor redColor];
//    };
    /**
     *  block作为方法参数进行传值
     */
    //接收传过来的值
    [twoDetailVC showTextFieldTextBlock:^(NSString *str) {
        NSLog(@"接收");
        //将接收到的值显示在cell的nameLable上
        twoCell.nameLabel.text = str;
        NSLog(@"str = %@",str);
        NSLog(@"twoCell.nameLabel.text = %@",twoCell.nameLabel.text);
        twoDetailVC.view.backgroundColor = [UIColor redColor];
    }];
   
    
    
   
    
}


@end
