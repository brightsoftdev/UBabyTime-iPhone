//
//  ArticlePageControl.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArticlePageControl.h"

@interface ArticlePageControl(private)  // 声明一个私有方法, 该方法不允许对象直接使用
- (void)updateDots;
@end

@implementation ArticlePageControl
@synthesize imagePageStateNormal=_imagePageStateNormal;
@synthesize imagePageStateHighlighted=_imagePageStateHighlighted;
- (id)initWithFrame:(CGRect)frame { // 初始化
    self = [super initWithFrame:frame];
    return self;
}
- (void)setImagePageStateNormal:(UIImage *)image {  // 设置正常状态点按钮的图片
    [_imagePageStateNormal release];
    _imagePageStateNormal = [image retain];
    [self updateDots];
}
- (void)setImagePageStateHighlighted:(UIImage *)image { // 设置高亮状态点按钮图片
    [_imagePageStateHighlighted release];
    _imagePageStateHighlighted = [image retain];
    [self updateDots];
}
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event { // 点击事件
    [super endTrackingWithTouch:touch withEvent:event];
    [self updateDots];
}
- (void)updateDots { // 更新显示所有的点按钮
    if (_imagePageStateNormal || _imagePageStateHighlighted)
    {
        NSArray *subview = self.subviews;  // 获取所有子视图
        for (NSInteger i = 0; i < [subview count]; i++)
        {
            UIImageView *dot = [subview objectAtIndex:i];  // 以下不解释, 看了基本明白
            dot.image = self.currentPage == i ? _imagePageStateNormal : _imagePageStateHighlighted;
        }
    }
}
- (void)dealloc { // 释放内存
    [_imagePageStateNormal release], _imagePageStateNormal = nil;
    [_imagePageStateHighlighted release], _imagePageStateHighlighted = nil;
    [super dealloc];
}
@end
