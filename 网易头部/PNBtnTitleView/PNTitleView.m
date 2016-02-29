//
//  PNTitleView.m
//  网易头部
//
//  Created by lpn on 16/2/26.
//  Copyright © 2016年 lpn. All rights reserved.
//
//#define btnCount 5

#define margin 10
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define btnWidth (SCREENWIDTH - (self.titleArr.count + 1) * margin) / self.titleArr.count

#import "PNTitleView.h"
#import "UIView+Extension.h"

@interface PNTitleView ()

/** title的文字数组*/
@property(nonatomic, strong) NSArray *titleArr;
/**当前选中的按钮*/
@property(nonatomic, weak) UIButton *currentSelBtn;

@property(nonatomic, weak) UIView *lineView;
@end


@implementation PNTitleView



- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        /// 标题文字
        self.titleArr = @[@"众投",@"投宝",@"优酷",@"京东",@"内涵",@"段子"];
        
        CGFloat titleH = 50;
        self.frame = CGRectMake(0, 20, SCREENWIDTH, titleH);
        self.backgroundColor = [UIColor colorWithRed:183/255.0 green:183 /255.0 blue:183/255.0 alpha:1.0];
        
        /// 添加标题
        [self addTitleViewBtns];
        
        
    }
    return self;
}

/** 
   下划线
 */
- (UIView *)viewWithLine
{
    UIView *lineView = [[UIView alloc] init];
    lineView.height = 3.0;
    lineView.y = CGRectGetMaxY(self.frame) - 20;
    
    lineView.backgroundColor = [UIColor redColor];
    return lineView;
}

/**
   手动设置选择index
 */
- (void)setSelIndex:(int)selIndex
{
    // 添加按钮
    UIButton *selBtn = (UIButton *)[self viewWithTag:selIndex + 1];
    [self btnClick:selBtn];
    
    // 添加直线
    UIView *lineView = [self viewWithLine];
    lineView.width = btnWidth;
    self.lineView = lineView;
    self.lineView.x = (selBtn.tag - 1) * (self.lineView.width+10) + 10;
    [self addSubview:self.lineView];
}

- (void)addTitleViewBtns
{
    // 5个btn
    CGFloat btnW = btnWidth;
    
    for (int i = 0; i < self.titleArr.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        
        
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = i * (btnW + margin)+ margin;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [btn setTitle:[NSString stringWithFormat:@"%@",self.titleArr[i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 标示
        btn.tag = i+1;
        [self addSubview:btn];
    }
    

}

/**
 按钮的点击事件
 */
- (void)btnClick:(UIButton *)btn
{
    
    self.currentSelBtn.selected = !self.currentSelBtn.selected;
    btn.selected = !btn.selected;
    self.currentSelBtn = btn;
    

    // 下划线的移动
    [UIView animateWithDuration:0.2 animations:^{
        self.lineView.x = (btn.tag - 1) * (self.lineView.width+10) + 10;
    }];
    
    
    // 事件
    if (self.myBtnClickBlock) {
        self.myBtnClickBlock((int)btn.tag - 1);
    }
    
   
}


#pragma mark - lazy
- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = [NSArray array];
    }
    return _titleArr;
}
@end
