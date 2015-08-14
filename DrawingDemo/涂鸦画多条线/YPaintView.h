//
//  YPaintView.h
//  涂鸦画多条线
//
//  Created by 杨立荣 on 15/8/13.
//  Copyright (c) 2015年 杨立荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPaintView : UIView

@property (nonatomic,strong) UIColor *currentColor;

- (void)back;

- (void)clearView;


@end
