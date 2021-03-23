//
//  NSObject+CFKVO.h
//  26-模拟KVO
//
//  Created by luokan on 2021/3/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CFKVO)

- (void)cf_addObserver:(NSObject *)observer forKey:(NSString *)key options:(NSKeyValueObservingOptions)options;
- (void)cf_removeObserver:(NSObject *)observer forKey:(NSString *)key;

-(void)cf_observeValueForKey:(NSString *)key ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change;

@end

NS_ASSUME_NONNULL_END
