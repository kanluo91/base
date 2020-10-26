//
//  ViewController.m
//  8-离屏渲染研究
//
//  Created by luokan on 2020/10/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*1. 会触发离屏渲染*/
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn1.frame = CGRectMake(100, 30, 100, 100);
    btn1.backgroundColor = [UIColor greenColor];
    
    [btn1 setImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    
    btn1.layer.cornerRadius = 50;
    //layer.cornerRadius 只设置了backgroundColor 和 border 的圆角
    
    btn1.clipsToBounds =  YES;
    // 开启这个属性  会对Content做圆角
    
    [self.view addSubview:btn1];
    
    
    /*2. 不会触发离屏渲染*/
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn2.frame = CGRectMake(100, 160, 100, 100);
    btn2.backgroundColor = [UIColor greenColor];
    
    [btn2 setImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
    
    btn2.imageView.layer.cornerRadius = 50;
    //只针对单个图层做了圆角  ios9.0 之后做了优化  只针对单个图层做圆角 不会触发离屏渲染
    
    btn1.clipsToBounds =  YES;
    
    [self.view addSubview:btn2];
    
    
    
    
    
}


@end
