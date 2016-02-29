//
//  ViewController.m
//  网易头部
//
//  Created by lpn on 16/2/25.
//  Copyright © 2016年 lpn. All rights reserved.
//



#import "ViewController.h"
#import "PNTitleView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PNTitleView *titleView = [[PNTitleView alloc] init];
    
    
    
    
    // 事件
    __weak typeof(titleView) titleV = titleView;
    
    titleView.myBtnClickBlock = ^(int index)
    {
        NSLog(@"%d tag%d事件",titleV.selIndex,index);
    };
    
    
    // 设置默认选中第一个按钮
    titleView.selIndex = 0;
  
    [self.view addSubview:titleView];
    
    
   
    
    

    
    
}


@end
