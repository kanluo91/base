//
//  JJTools.m
//  5-单例模式
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import "JJTools.h"

@implementation JJTools

static JJTools *_instance;

//1.从写allocWithZone 方法  (alloc/new ----> allocWithZone:)

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    
    // 2种方案都可以
    
    // 加互斥锁 解决线程安全问题
//    @synchronized (self) {
//        if(_instance == nil){
//            _instance = [super allocWithZone:zone];
//        }
//    }
    
    
//    dispatch_once 本身就是线程安全的
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });

    return _instance;
}

-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

+(instancetype)sharedInstance{
    return [[self alloc] init];
}


#pragma mark -
#pragma mark MRC环境
// 判断是不是ARC 环境
#if __has_feature(objc_arc)

#else
-(oneway void)release{
    
}

-(instancetype)retain{
    return _instance;
}

-(NSUInteger)retainCount{
    return NSIntegerMax;
}

#endif


@end
