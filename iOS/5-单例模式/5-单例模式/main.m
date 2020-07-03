//
//  main.m
//  5-单例模式
//
//  Created by luokan on 2020/7/3.
//  Copyright © 2020 金角大王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
//    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
