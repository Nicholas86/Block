//
//  SecondVController.h
//  LessonBlockPassValue
//
//  Created by lanouhn on 15/10/10.
//  Copyright (c) 2015年 LiYang. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void(^secondBlock) (NSString *);
@interface SecondVController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *TextField;
@property (nonatomic, copy) void(^secondBlock)(NSString *str);
@end
