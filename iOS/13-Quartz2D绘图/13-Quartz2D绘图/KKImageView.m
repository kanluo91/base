//
//  KKImageView.m
//  13-Quartz2D绘图
//
//  Created by luokan on 2021/3/1.
//

#import "KKImageView.h"

@implementation KKImageView

-(void)setImage:(UIImage *)image{
    _image = image;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.image drawInRect:rect];
}


@end
