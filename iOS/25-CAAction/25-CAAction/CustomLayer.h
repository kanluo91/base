//
//  CustomLayer.h
//  25-CAAction
//
//  Created by luokan on 2021/3/18.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomLayer : CALayer

-(id<CAAction>)actionForKey:(NSString *)event;

@end

NS_ASSUME_NONNULL_END
