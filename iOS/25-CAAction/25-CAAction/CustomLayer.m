//
//  CustomLayer.m
//  25-CAAction
//
//  Created by luokan on 2021/3/18.
//

#import "CustomLayer.h"

@implementation CustomLayer

-(id<CAAction>)actionForKey:(NSString *)event{
    
    return [CAAnimation animation];
}
@end
