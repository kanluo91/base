//
//  ViewController.m
//  13-Quartz2D绘图
//
//  Created by luokan on 2021/2/27.
//

#import "ViewController.h"
#import "CustomView.h"
#import "ProgressView.h"

@interface ViewController ()

@property (nonatomic,strong) CustomView *ctView;

@property (nonatomic,strong) ProgressView *progressView;

@property (nonatomic,strong) UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageview.backgroundColor = [UIColor yellowColor];
    
//    [self 绘图];
//    [self 绘制图片_带边框];
    [self 页面截屏];
  

}

-(void) 绘图{
    self.ctView = [CustomView new];
    
    self.ctView.frame = CGRectMake(100, 100, 300, 300);
    
    [self.view addSubview:self.ctView];
    
    self.progressView = [ProgressView new
                         ];
    self.progressView.backgroundColor = [UIColor whiteColor];
    self.progressView.frame = CGRectMake(100, 400, 300, 300);
    
    [self.view addSubview:self.progressView];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 750, 400, 50)];
    self.slider.maximumValue = 1;
    self.slider.minimumValue = 0;
    [self.view addSubview:self.slider];
    [self.slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
}

-(void) 绘制裁剪图片{
    
    UIImage *image = [UIImage imageNamed:@"001"];
    
    UIGraphicsBeginImageContext(image.size);
   
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [path addClip];
    
    [image drawAtPoint:CGPointZero];
    
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.imageview.image = newImage;

    
}

-(void) 绘制图片_带边框{
    
    // 1. 边框width
    CGFloat borderWidth = 10;
    
    UIImage *image = [UIImage imageNamed:@"001"];
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width+2*borderWidth, image.size.height+2*borderWidth));
    
    // 先绘制外圈元
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width+2*borderWidth, image.size.height+2*borderWidth)];
    [[UIColor redColor] set];
    [path fill];
   
    // 绘制内圈
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, image.size.width, image.size.height)];
    [path addClip];
    
    [image drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.imageview.image = newImage;
    
}

-(void) 页面截屏{
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    // 把控制器的view 渲染到上下文中
    // 不能采用画的方式 要采用渲染的方式
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.view.layer renderInContext:ctx];
    
    // 从上下文生成图片
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.imageview.image = image;
    
}

-(void) sliderValueChange:(UISlider *) slider{
    
    self.progressView.progress = slider.value;
    
}

@end
