//
//  SingleInstance.h
//  5-单例模式
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//  单利的模板

#ifndef SingleInstance_h
#define SingleInstance_h
// 单参数的宏   拼接用##

#if __has_feature(objc_arc)
#define SingleH(name)  +(instancetype)shared##name;
#define SingleM(name)  static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
-(id)copyWithZone:(NSZone *)zone{\
    return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone{\
    return _instance;\
}\
\
+(instancetype)shared##name{\
    return [[self alloc] init];\
}
#else

#define SingleH(name)  +(instancetype)shared##name;
#define SingleM(name)  static id _instance;\
+(instancetype)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    return _instance;\
}\
\
-(id)copyWithZone:(NSZone *)zone{\
    return _instance;\
}\
\
-(id)mutableCopyWithZone:(NSZone *)zone{\
    return _instance;\
}\
\
+(instancetype)shared##name{\
    return [[self alloc] init];\
}\
-(oneway void)release{\
    \
}\
\
-(instancetype)retain{\
    return _instance;\
}\
\
-(NSUInteger)retainCount{\
    return NSIntegerMax;\
}

#endif



#endif /* SingleInstance_h */
