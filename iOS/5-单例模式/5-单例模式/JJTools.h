//
//  JJTools.h
//  5-单例模式
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJTools : NSObject<NSCopying,NSMutableCopying>

+(instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
