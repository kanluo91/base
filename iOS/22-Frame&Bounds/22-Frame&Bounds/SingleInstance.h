//
//  SingleInstance.h
//  22-Frame&Bounds
//
//  Created by luokan on 2021/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleInstance : NSObject<NSCopying,NSMutableCopying>

+(instancetype) sharedInstance;

@end

NS_ASSUME_NONNULL_END
