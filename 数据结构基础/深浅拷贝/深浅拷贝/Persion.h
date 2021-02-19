//
//  Persion.h
//  深浅拷贝
//
//  Created by luokan on 2021/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Persion : NSObject<NSCopying>

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign) int age;

@end

NS_ASSUME_NONNULL_END
