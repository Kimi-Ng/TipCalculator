//
//  BackgroundView.m
//  TipCalculator
//
//  Created by Cheng-Yuan Wu on 6/12/15.
//  Copyright (c) 2015 Kimi. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

- (void)drawRect:(CGRect)rect
{
    //定义画图的path
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    //path移动到开始画图的位置
    [path moveToPoint:CGPointMake(50, 50)];
    //从开始位置画一条直线到（160， 150）
    [path addLineToPoint:CGPointMake(160, 150)];
    //在从（160，150）画一条线到（10，150）
    [path addLineToPoint:CGPointMake(10, 150)];
    
    //关闭path
    [path closePath];
    
    //三角形内填充绿色
    [[UIColor greenColor] setFill];
    [path fill];
    //三角形的边框为红色
    [[UIColor redColor] setStroke];
    [path stroke];
    
    //在DrawRect方法中使用NSAttributedString画文字
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"this is my triangle"];
    [attrString drawAtPoint:CGPointMake(150, 150)];
    
    //在DrawRect方法中画图片
    UIImage *image = [UIImage imageNamed:@"drawRect.png"];
    [image drawAtPoint:CGPointMake(150, 180)];
}


@end
