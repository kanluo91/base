//
//  CustomView.m
//  25-CAAction
//
//  Created by luokan on 2021/3/18.
//

#import "CustomView.h"
#import "CustomLayer.h"

@implementation CustomView

//-(instancetype)init{
//    if(self = [super init]){
////        self.sLayer = [CustomLayer layer];
//////        self.sLayer.delegate = self;
////        [self.layer addSublayer:self.sLayer];
//
////        [self setNeedsDisplay];
////        [self setNeedsFocusUpdate];
////        [self setNeedsDisplayInRect:CGRectZero];
////        [self setNeedsLayout];
////        [self setNeedsUpdateConstraints];
////
//    }
//    return self;
//}

-(void)drawRect:(CGRect)rect{
    NSLog(@"原生绘制-----1\n");
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"原生绘制-----2\n");
}

-(void)displayLayer:(CALayer *)layer{

    NSLog(@"异步绘制\n");
}

@end
