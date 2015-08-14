//
//  UIImage+YMethods.m
//  涂鸦画多条线
//
//  Created by 杨立荣 on 15/8/13.
//  Copyright (c) 2015年 杨立荣. All rights reserved.
//

#import "UIImage+YMethods.h"

@implementation UIImage (YMethods)

+ (UIImage *)captureImage:(UIView *)captureView
{
    //创建一个位图上下文
    UIGraphicsBeginImageContext(captureView.bounds.size);
    
    //把view渲染到位图上
    [captureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //获取图片
    UIImage *captureImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束位图的编辑
    UIGraphicsEndImageContext();
    
    //返回
    return captureImage;
}

@end
