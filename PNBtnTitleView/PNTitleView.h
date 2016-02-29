//
//  PNTitleView.h
//  网易头部
//
//  Created by lpn on 16/2/26.
//  Copyright © 2016年 lpn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnBlock)(int index);

@interface PNTitleView : UIView
/** 选择按钮的索引*/
@property(nonatomic, assign) int selIndex;



/// 点击事件block
@property(nonatomic,copy)btnBlock myBtnClickBlock;


@end
