//
//  ViewController.m
//  涂鸦画多条线
//
//  Created by 杨立荣 on 15/8/13.
//  Copyright (c) 2015年 杨立荣. All rights reserved.
//

#import "ViewController.h"
#import "YPaintView.h"
#import "UIImage+YMethods.h"

@interface ViewController ()

- (IBAction)back;

- (IBAction)clean;

- (IBAction)save;

@property (weak, nonatomic) IBOutlet YPaintView *paintView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)back
{
    [self.paintView back];
}

- (IBAction)clean
{
    [self.paintView clearView];
}

- (IBAction)save
{
    UIImage *captureImage = [UIImage captureImage:self.paintView];
    
    NSData *imageData = UIImagePNGRepresentation(captureImage);
    
    [imageData writeToFile:@"/Users/yanglirong/Desktop/capture.png" atomically:YES];
}


- (IBAction)colorBtnClick:(UIButton *)sender
{
    self.paintView.currentColor = sender.backgroundColor;
}


@end
















