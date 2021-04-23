//
//  Performance.h
//  腾讯面试
//
//  Created by luokan on 2021/3/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//假设APP有一个Preference类，用于保存用户设置，这个类有一些成员变量，比如字体大小，夜间模式，等等

NS_ASSUME_NONNULL_BEGIN

@class Performance;
@protocol PerformanceProtocol <NSObject>

-(void) performanceUIChange:(Performance *)perfomacne;

@end

@interface Performance : NSObject

@property (nonatomic,strong) UIColor *color;

@property (nonatomic,strong) UIFont *font;

-(void) addUIChangeObserver:(id<PerformanceProtocol>) observer;

@end

NS_ASSUME_NONNULL_END
