//
//  YPaintView.m
//  涂鸦画多条线
//
//  Created by 杨立荣 on 15/8/13.
//  Copyright (c) 2015年 杨立荣. All rights reserved.
//

#import "YPaintView.h"

@interface YPaintView()

@property (nonatomic,strong) NSMutableArray *allLine; //存放所有线的点

@property (nonatomic,strong) NSMutableArray *allColorOfLines; //存放所有线的颜色

@end

@implementation YPaintView


- (NSMutableArray *) allLine
{
    if (_allLine == nil)
    {
        _allLine = [NSMutableArray array];
    }
    
    return _allLine;
}

- (NSMutableArray *) allColorOfLines
{
    if (! _allColorOfLines)
    {
        _allColorOfLines = [NSMutableArray array];
    }
    return _allColorOfLines;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // 上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //获取线的总条数
    NSInteger linesNumber = self.allLine.count;
    
    for (NSInteger i = 0; i < linesNumber; i ++)
    {
        //获取数组中对应i的线的点数组
        NSArray *pointsOfAline = self.allLine[i];
        
        //获取对应线的点数
        NSInteger pointsNumberInAline = pointsOfAline.count;
        
        //遍历该条线的所有点数
        for (NSInteger j = 0; j < pointsNumberInAline; j ++)
        {
            CGPoint location = [pointsOfAline[j] CGPointValue];
            if (j == 0)
            {
                CGContextMoveToPoint(context,location.x,location.y);
            }else
            {
                CGContextAddLineToPoint(context, location.x, location.y);
            }
        }
        
        //设置线条颜色
        UIColor *lineColor = self.allColorOfLines[i];
        [lineColor set];
        
        //设置线条宽度
        CGContextSetLineWidth(context, 5);
        
        //设置线条首尾和连接点的样式
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineJoin(context, kCGLineJoinRound);
        
        //渲染
        CGContextStrokePath(context);
    }
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //每触摸一次创建一条线数组然后将其添加到所有的线数组中
    NSMutableArray *pointsOfLine = [NSMutableArray array];
    
    [self.allLine addObject:pointsOfLine];
    
    //判断当前颜色是否为空，为空则设为黑色
    if (!self.currentColor)
    {
        [self.allColorOfLines addObject:[UIColor blackColor]];
    }else
    {
        [self.allColorOfLines addObject:self.currentColor];
    }
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //移动之后将移动的点的坐标存入数组中
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self];
    
    NSMutableArray *pointsOfLine = [self.allLine lastObject];
    [pointsOfLine addObject:[NSValue valueWithCGPoint:touchPoint]];
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"%ld",self.allLine.count);
}

- (void)back
{
    //将数组中的最后一条线删除
    [self.allLine removeLastObject];
    
    //重绘
    [self setNeedsDisplay];
}

- (void)clearView
{
    //移除数组中的所有线
    [self.allLine removeAllObjects];
    
    //重绘
    [self setNeedsDisplay];
}

@end


















