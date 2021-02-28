//
//  ProgressView.m
//  13-Quartz2D绘图
//
//  Created by luokan on 2021/2/27.
//

#import "ProgressView.h"

@implementation ProgressView

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
   
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    CGFloat startAngle = 0;
    CGFloat endAngle =  startAngle + _progress * (M_PI *2);
    NSLog(@"endAngle = %f\n" ,endAngle);

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.frame.size.width/2.0-5 startAngle:startAngle endAngle:endAngle clockwise:YES];
    [[UIColor redColor] set];
//    [path stroke];

    CGContextAddPath(ctx, path.CGPath);

    CGContextStrokePath(ctx);

}


@end
