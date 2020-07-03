//
//  JJTestInstance.m
//  5-单例模式
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "JJTestInstance.h"

@implementation JJTestInstance

SingleM(TestInstance)

-(void) haha{
    NSLog(@"haha - %p",self);
}

@end
