//
//  ViewController.m
//  autoLayout登陆动画
//
//  Created by 王志盼 on 15/7/7.
//  Copyright (c) 2015年 王志盼. All rights reserved.
//

#import "ViewController.h"
#import "NSLayoutConstraint+Extend.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
- (IBAction)didClickLoginButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self.accountField becomeFirstResponder];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//思路：删除旧值、添加新值
//复原：删除新值、回复旧值
- (void)keyBoardWillAppear:(NSNotification *)note
{
    
//    NSLog(@"%@",note.userInfo);
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-self.view.frame.size.height * 0.4];
    
    NSLayoutConstraint *oldConstraint = [NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-40];
    
    for (NSLayoutConstraint *constraint in self.view.constraints) {
        if ([NSLayoutConstraint isEquallWithConstraint:constraint oldConstraint:oldConstraint]) {
            [self.view removeConstraint:constraint];
            break;
        }
    }
    [self.view addConstraint:newConstraint];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)keyBoardWillDisappear:(NSNotification *)note
{
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-self.view.frame.size.height * 0.4];
    
    NSLayoutConstraint *oldConstraint = [NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-40];
    
    for (NSLayoutConstraint *constraint in self.view.constraints) {
        if ([NSLayoutConstraint isEquallWithConstraint:constraint oldConstraint:newConstraint]) {
            [self.view removeConstraint:constraint];
            break;
        }
    }
    [self.view addConstraint:oldConstraint];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickLoginButton:(id)sender {
    
    [self.view endEditing:YES];
}
@end
