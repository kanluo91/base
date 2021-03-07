//
//  SingleInstance2.h
//  5-单例模式
//
//  Created by luokan on 2021/3/7.
//  Copyright © 2021 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleInstance2 : NSObject<NSCopying,NSMutableCopying>

+(instancetype) sharedInstance;


@end

NS_ASSUME_NONNULL_END
