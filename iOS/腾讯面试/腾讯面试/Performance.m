//
//  Performance.m
//  腾讯面试
//
//  Created by luokan on 2021/3/15.
//

#import "Performance.h"
#import <Foundation/NSPointerFunctions.h>


@interface Performance()

@property (nonatomic,strong) NSPointerArray *observers;

@end

@implementation Performance

-(NSPointerArray *)observers{
    if(!_observers){
        _observers = [NSPointerArray weakObjectsPointerArray];
    }
    return _observers;
}

-(void) addUIChangeObserver:(id) observer{
    if(observer == NULL) return;
    if(![[self.observers allObjects] containsObject:observer]){
        [self.observers addPointer:(__bridge  void *)observer];
    }
}

-(void)setFont:(UIFont *)font{
    if(_font != font){
        _font = font;
        [[self.observers allObjects] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if(obj && [obj respondsToSelector:@selector(performanceUIChange:)]){
                            [obj performSelector:@selector(performanceUIChange:) withObject:self];
                        }
                    });
                }];
    }
}

@end
