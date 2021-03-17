//
//  NSObject+Swizzling.m
//  23-Runtime坑
//
//  Created by luokan on 2021/3/17.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+(void) swizzleCls:(Class)clz Sel:(SEL)originSel WithSel:(SEL) targetSel{
    if(clz == NULL) return;
    Method oriM = class_getInstanceMethod(clz, originSel);
    Method tarM = class_getInstanceMethod(clz, targetSel);
    
    // 原方法没有实现 添加oriM -> tarIMP
    if(class_addMethod(clz, originSel, method_getImplementation(tarM), method_getTypeEncoding(tarM))){
        // 换掉tarM
        class_replaceMethod(clz, targetSel, method_getImplementation(oriM
                                                                     ), method_getTypeEncoding(oriM));
    }else{// 原方法实现啊了
        method_exchangeImplementations(oriM, tarM);
    }
    
}


@end
