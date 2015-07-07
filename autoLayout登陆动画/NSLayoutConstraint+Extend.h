//
//  NSLayoutConstraint+Extend.h
//  autoLayout登陆动画
//
//  Created by 王志盼 on 15/7/7.
//  Copyright (c) 2015年 王志盼. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Extend)
//判断两个约束是否相同
+ (BOOL)isEquallWithConstraint:(NSLayoutConstraint *)newConstraint oldConstraint:(NSLayoutConstraint *)oldConstraint;
@end
