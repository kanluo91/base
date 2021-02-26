//
//  RedView.m
//  12-hitTest2
//
//  Created by luokan on 2021/2/26.
//

#import "RedView.h"
#import "GreenView.h"

@implementation RedView

-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    for (UIView *subView in self.subviews) {
        if([subView isKindOfClass:[GreenView class]]){
            CGPoint subpoint = [self convertPoint:point toView:subView];
            if([subView pointInside:subpoint withEvent:event]){
                return subView;
            }
        }
    }
    
    return [super hitTest:point withEvent:event];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"Red Touch");
}

// 拖拽移动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint curpoint = [t locationInView:self];
    CGPoint prepoint = [t previousLocationInView:self];
    
    self.transform = CGAffineTransformTranslate(self.transform, curpoint.x-prepoint.x, curpoint.y-prepoint.y);
    
}


@end
