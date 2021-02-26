//
//  RedView.m
//  10-CGAffineTransform
//
//  Created by luokan on 2021/2/26.
//

#import "RedView.h"

@implementation RedView


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch =  [touches anyObject];
    
    CGPoint curPoint = [touch locationInView:self];
    
    CGPoint prePoint = [touch previousLocationInView:self];
    
    CGFloat x,y;
    x = curPoint.x - prePoint.x;
    y = curPoint.y - prePoint.y;
    
    self.transform = CGAffineTransformTranslate(self.transform, x, y);
    
}

@end
