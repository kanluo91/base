//
//  GreenView.m
//  12-hitTest2
//
//  Created by luokan on 2021/2/26.
//

#import "GreenView.h"

@implementation GreenView

-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"Green Touch");
}

@end
