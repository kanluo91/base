//
//  SingleInstance.m
//  22-Frame&Bounds
//
//  Created by luokan on 2021/3/15.
//

#import "SingleInstance.h"

static SingleInstance *_instance = nil;
@implementation SingleInstance

+(instancetype) sharedInstance{
    return [[self alloc] init];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
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

//// MRC
//-(instancetype)retain{
//    
//}
//-(void) release{
//    
//}
//
//-(NSUInteger)retainCount{
//    return NSIntegerMax;
//}
@end
