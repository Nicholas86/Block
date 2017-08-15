//
//  CustomViewCell.h
//  LessonStoryBoard-PM-UI19
//
//  Created by lanouhn on 15/9/24.
//  Copyright (c) 2015年 梅消寒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *photoImage;//图像
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;//用户名
@property (strong, nonatomic) IBOutlet UILabel *phoneNumberLable;//电话号码

@end
