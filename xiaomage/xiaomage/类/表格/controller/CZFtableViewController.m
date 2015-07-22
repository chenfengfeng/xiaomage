//
//  CZFtableViewController.m
//  xiaomage
//
//  Created by 陈泽峰 on 15/7/22.
//  Copyright (c) 2015年 陈泽峰. All rights reserved.
//

#import "CZFtableViewController.h"

@interface CZFtableViewController ()<UITextViewDelegate,UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *classes;
@property (weak, nonatomic) IBOutlet UITextField *day;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@end

@implementation CZFtableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    //用[NSDate date]可以获取系统当前时间
    self.day.text = [dateFormatter stringFromDate:[NSDate date]];
    
    // 班级
    self.classes.text = @"大神一班";
}
#pragma mark - 学习内容难度
- (IBAction)click_one:(id)sender {
    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:@"选择学习难度" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"很难",@"不太难",@"一般般",@"比较简单",@"很简单", nil];
    action.tag = 10;
    [action showInView:self.view.window];
}

#pragma mark - 吸收了多少
- (IBAction)click_two:(id)sender {
    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:@"选择学习难度" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"80%以上",@"70%~80%",@"50%~70%",@"30%~50%",@"低于30%", nil];
    action.tag = 20;
    [action showInView:self.view.window];
}

#pragma mark - 提交
- (IBAction)return:(id)sender {
}

#pragma mark - 代理
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (text.length > 0) {
        self.label.hidden = YES;
    }else{
        self.label.hidden = NO;
    }
    return YES;
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 10) {
        [self.btn1 setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
    }else{
        [self.btn2 setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
    }
}

@end
