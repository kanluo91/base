//
//  NSObject+Swizzling.h
//  23-Runtime坑
//
//  Created by luokan on 2021/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)

+(void) swizzleCls:(Class)clz Sel:(SEL)originSel WithSel:(SEL) targetSel;

@end

NS_ASSUME_NONNULL_END
