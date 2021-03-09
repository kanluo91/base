//
//  UIApplication+Action.m
//  15-响应链事件派发
//
//  Created by luokan on 2021/3/7.
//

#import "UIApplication+Action.h"
#import <objc/runtime.h>

@implementation UIApplication (Action)


-(void)sendEvent:(UIEvent *)event
{
    NSLog(@"sendEvent: %@\n",event);
}

-(BOOL) jjsendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event{
    
    NSLog(@"sendAction:from %@  to:%@\n",sender,target);
    
    return YES;
    
}

@end
