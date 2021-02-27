//
//  CustomView.m
//  13-Quartz2D绘图
//
//  Created by luokan on 2021/2/27.
//

#import "CustomView.h"
@interface CustomView()
//
//@property (nonatomic,assign) CGContextRef ctx;
//
//@property (nonatomic,strong) UIBezierPath *path;

@property (nonatomic,assign) int progress;

@end

@implementation CustomView


-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor systemPinkColor];
    }
    return self;
}


///   作用： 绘图
///   什么时候调用：
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
//    [self 矩形:ctx];
    
//    [self 圆角矩形:ctx];
    
//    [self 椭圆:ctx];
    
//    [self 画弧:ctx];
    
    [self 圆形进度条:ctx];
    
}




/// 矩形
/// @param ctx 上下文
-(void) 矩形:(CGFontRef) ctx{
    
    //  画矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    
//    [[UIColor redColor] setStroke]; // stroke 填充模式颜色
//    [[UIColor redColor] setFill]; // 填充模式
    
    [[UIColor yellowColor] set];
    
    [path fill];
    
    
    // 清空之前操作
    [path removeAllPoints];
    
    // 画线
    
    [path moveToPoint:CGPointMake(20, 50)];
    
    [path addLineToPoint:CGPointMake(100, 200)];
    
    [path setLineWidth:5];
    
    [[UIColor greenColor] set];
    
//    [[UIColor greenColor] setFill];
//
//    [[UIColor greenColor] setStroke];
    
    
//    // 保存绘制的path 到图形上下文
//    CGContextAddPath(ctx, path.CGPath);
//    // 上下中去渲染path ( stroke / fill 2种模式)
//    CGContextStrokePath(ctx);
//
//    CGContextFillPath(ctx);
    
    // 上面步骤的简写
    [path stroke]; // [path fill];
}

-(void) 圆角矩形:(CGFontRef) ctx{
    
    UIBezierPath *path =[UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 100, 200, 100) cornerRadius:20];
    
    [[UIColor greenColor] setFill];
    
    [path fill];
}

-(void) 椭圆:(CGFontRef) ctx{
    
    // 画椭圆
    UIBezierPath *path =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 150,250)];
    
    [[UIColor greenColor] setFill];
    
    [[UIColor yellowColor] setStroke];
    
    [path fill];
    
}


-(void) 画弧:(CGFontRef) ctx{
    
    /*画圆弧
     * 参数1: 圆心点
     * 参数2：起始弧度
     * 参数3：结束弧度
     * 参数4：wise：YES 顺时针  NO 逆时针
     */
    
    CGPoint center = CGPointMake(150, 150);
    
    UIBezierPath *path  = [UIBezierPath bezierPathWithArcCenter:center radius:80 startAngle:0 endAngle:M_PI * 3 /4.0 clockwise:YES];
    
    [path addLineToPoint:center];
    
    [path closePath];
    
    [[UIColor yellowColor] set];
    
    [path stroke]; // [path fill];  会自动关闭路径
    
    
}

-(void) 圆形进度条:(CGContextRef) ctx{
    
    
}


@end
