//
//  GreenView.m
//  11- HitTest01
//
//  Created by luokan on 2021/2/26.
//

#import "GreenView.h"

@implementation GreenView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"GreenView   touch\n");
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    
    if(self.weakBtn){
       CGPoint btnPoint = [self convertPoint:point toView:self.weakBtn];
        if([self.weakBtn pointInside:btnPoint withEvent:event]){
            return self.weakBtn;
        }
    }
    return [super hitTest:point withEvent:event];
}

@end
