//
//  NSLayoutConstraint+Extend.m
//  autoLayout登陆动画
//
//  Created by 王志盼 on 15/7/7.
//  Copyright (c) 2015年 王志盼. All rights reserved.
//

#import "NSLayoutConstraint+Extend.h"

@implementation NSLayoutConstraint (Extend)

//@property (readonly, assign) id firstItem;
//@property (readonly) NSLayoutAttribute firstAttribute;
//@property (readonly) NSLayoutRelation relation;
//@property (readonly, assign) id secondItem;
//@property (readonly) NSLayoutAttribute secondAttribute;
//@property (readonly) CGFloat multiplier;
+ (BOOL)isEquallWithConstraint:(NSLayoutConstraint *)newConstraint oldConstraint:(NSLayoutConstraint *)oldConstraint
{
    if (![newConstraint.firstItem isEqual:oldConstraint.firstItem]) {
        return NO;
    }
    if (newConstraint.firstAttribute != oldConstraint.firstAttribute) {
        return NO;
    }
    if (newConstraint.relation != oldConstraint.relation) {
        return NO;
    }
    if (![newConstraint.secondItem isEqual:oldConstraint.secondItem]) {
        return NO;
    }
    if (newConstraint.secondAttribute != oldConstraint.secondAttribute) {
        return NO;
    }
    if (newConstraint.multiplier != oldConstraint.multiplier) {
        return NO;
    }
    if (newConstraint.constant != oldConstraint.constant) {
        return NO;
    }
    
    if (newConstraint.secondItem != nil && oldConstraint.secondItem != nil && ([newConstraint.secondItem isEqual:oldConstraint.secondItem])) {
        return YES;
    }else if (newConstraint.secondItem == nil && oldConstraint.secondItem == nil)
    {
        return YES;
    }
    return NO;
}
@end
