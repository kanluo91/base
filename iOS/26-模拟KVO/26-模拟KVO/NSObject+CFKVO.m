//
//  NSObject+CFKVO.m
//  26-模拟KVO
//
//  Created by luokan on 2021/3/20.
//

#import "NSObject+CFKVO.h"
#import <objc/runtime.h>
#import <objc/message.h>

static NSString *kCFKVONotifiy_ = @"CFKVONotifiy_";

@implementation NSObject (CFKVO)


void kvo_setter(id self,SEL _cmd,id newValue){
    
    
}

/// 添加观察者
/// @param observer 观察者
/// @param key 观察的key
/// @param options 选项

/*
 * 1. 注册类
 * 2. 修改isa
 * 3. 重写set方法 class方法
 * 4. 发送通知 或者block 通知外界
 */

- (void)cf_addObserver:(NSObject *)observer forKey:(NSString *)key options:(NSKeyValueObservingOptions)options{
    
    // 1. Class
    Class clz = [self class];
    
    // 2. 获取set方法名字
    NSString *setterName = [NSString stringWithFormat:@"set%@",[key capitalizedString]];
    
    SEL setterSel = NSSelectorFromString(setterName);
    
    Method ori = class_getInstanceMethod(clz, setterSel);
    if(ori == NULL){
        NSLog(@"这个 %@ 的set方法不存在\n",key);
        return;
    }
    
    // 3. 判断是否已经ISA了
    Class clz2 = object_getClass(self);
    NSString *clzName = NSStringFromClass(clz2);
    if([clzName hasPrefix:kCFKVONotifiy_])
    {
        NSLog(@"这个类已经修改了ISA指向\n");
        return;
    }
    
    NSString *newclzName = [NSString stringWithFormat:@"%@%@",kCFKVONotifiy_,clzName];
    if(NSClassFromString(newclzName) == NULL){
        NSLog(@"这个类之前没有注册过，可以注册\n");
        // 创建新类
       Class newClz =  objc_allocateClassPair([self class], [newclzName UTF8String], 0);
        objc_registerClassPair(newClz);
        // 修改isa
        object_setClass(self, newClz);
        
        // 添加set方法
        BOOL isSucc = class_addMethod(newClz, setterSel, (IMP)kvo_setter, method_getTypeEncoding(ori));
        
    }
    
}


- (void)cf_removeObserver:(NSObject *)observer forKey:(NSString *)key{
    
    
}

-(void)cf_observeValueForKey:(NSString *)key ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change{
    
}

@end
