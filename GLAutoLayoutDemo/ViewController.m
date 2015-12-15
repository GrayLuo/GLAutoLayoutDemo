//
//  ViewController.m
//  GLAutoLayoutDemo
//
//  Created by hyq on 15/12/15.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (weak, nonatomic) IBOutlet UIButton *mutipleButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    _topButton.translatesAutoresizingMaskIntoConstraints = NO;
    _mutipleButton.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomButton.translatesAutoresizingMaskIntoConstraints = NO;

    /*
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:40],
                                [NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-40],
                                [NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:40],
                                [NSLayoutConstraint constraintWithItem:_contentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:-40]
                                ]];
    
    
    [_contentView addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem:_topButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeTop multiplier:1 constant:40],
                                   [NSLayoutConstraint constraintWithItem:_topButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:40],
                                   [NSLayoutConstraint constraintWithItem:_topButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-40],
                                   ]];
    [_contentView addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem:_mutipleButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_topButton attribute:NSLayoutAttributeBottom multiplier:1 constant:40],
                                   [NSLayoutConstraint constraintWithItem:_mutipleButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_topButton attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0],
                                   [NSLayoutConstraint constraintWithItem:_mutipleButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
                                   ]];
    [_contentView addConstraints:@[
                                   [NSLayoutConstraint constraintWithItem:_bottomButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-40],
                                   [NSLayoutConstraint constraintWithItem:_bottomButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:40],
                                   [NSLayoutConstraint constraintWithItem:_bottomButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-40],
                                   ]];

     */

    NSDictionary *dic = NSDictionaryOfVariableBindings(self.view,_contentView,_topButton,_mutipleButton,_bottomButton);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[_contentView]-40-|" options:0 metrics:nil views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[_contentView]-40-|" options:0 metrics:nil views:dic]];

    
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[_topButton]-40-|" options:0 metrics:nil views:dic]];
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[_topButton]" options:0 metrics:nil views:dic]];


    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_topButton]-40-[_mutipleButton]" options:0 metrics:nil views:dic]];
    
    //我们这样设置无法居中_mutipleButton,还是得使用非VFL方式
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=0)-[_mutipleButton]-(>=0)-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:dic]];
    [_contentView addConstraint:[NSLayoutConstraint constraintWithItem:_mutipleButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    //这样添加是无效的，因为frame受到了constraint的影响，所以frame自然就无法作为我们调整比例的参考。
//    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_mutipleButton(==MutipleButtonWidth)]" options:0 metrics:@{@"MutipleButtonWidth":@(_topButton.bounds.size.width/2)} views:dic]];
    
    //所以还是得使用NSLayoutConstraint来实现相关的比例约束
    [_contentView addConstraint:[NSLayoutConstraint constraintWithItem:_mutipleButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_topButton attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
    
    
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[_bottomButton]-40-|" options:0 metrics:nil views:dic]];
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_bottomButton(==30)]-40-|" options:0 metrics:nil views:dic]];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
