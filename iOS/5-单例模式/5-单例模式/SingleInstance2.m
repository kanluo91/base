//
//  SingleInstance2.m
//  5-单例模式
//
//  Created by luokan on 2021/3/7.
//  Copyright © 2021 金角大王. All rights reserved.
//

#import "SingleInstance2.h"

@implementation SingleInstance2

+(instancetype) sharedInstance{
    return [[self alloc] init];
}

static id _instance = nil;

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

-(id) mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}


// MRC
-(oneway void)release{
    
}

-(instancetype)retain{
    return _instance;
}

-(NSUInteger)retainCount{
    return NSIntegerMax;
}



@end
