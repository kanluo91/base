//
//  CustomView.m
//  27-CoreText
//
//  Created by luokan on 2021/3/21.
//

#import "CustomView.h"
#import <CoreText/CoreText.h>

@implementation CustomView

static CGFloat ascentCallBacks(void * ref)
{
    return [(NSNumber *)[(__bridge NSDictionary *)ref valueForKey:@"height"] floatValue];
}
static CGFloat descentCallBacks(void * ref)
{
    return 0;
}
static CGFloat widthCallBacks(void * ref)
{
    return [(NSNumber *)[(__bridge NSDictionary *)ref valueForKey:@"width"] floatValue];
}


-(void)drawRect:(CGRect)rect{
    [self customDraw];
}

//
//-(void)displayLayer:(CALayer *)layer{
//    
//}

-(void) customDraw{
    // 1. 拿到上下文
    CGContextRef context = UIGraphicsGetCurrentContext();

    // 2. 转换坐标系
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);//设置字形的变换矩阵为不做图形变换
        CGContextTranslateCTM(context, 0, self.bounds.size.height);//平移方法，将画布向上平移一个屏幕高
        CGContextScaleCTM(context, 1.0, -1.0);//缩放方法，x轴缩放系数为1，则不变，y轴缩放系数为-1，则相当于以x轴为轴旋转180度
        
        NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc] initWithString:@"\n这里在测试图文混排，\n我是一个富文本"];//这句不用我多说吧，最起码得有个富文本啊才能插入不是。
        
        CTRunDelegateCallbacks callBacks; // 回调
        memset(&callBacks, 0, sizeof(CTRunDelegateCallbacks));
    //    callBacks.version = "1.0";
        callBacks.getWidth = widthCallBacks;
        callBacks.getAscent = ascentCallBacks;
        callBacks.getDescent = descentCallBacks;
        
        NSDictionary * dicPic = @{@"height":@129,@"width":@400};
        CTRunDelegateRef delegate = CTRunDelegateCreate(& callBacks, (__bridge void *)dicPic);
        unichar placeHolder = 0xFFFC; // 空白字符
        NSString * placeHolderStr = [NSString stringWithCharacters:&placeHolder length:1];
        NSMutableAttributedString * placeHolderAttrStr = [[NSMutableAttributedString alloc] initWithString:placeHolderStr];
        // 空白字符串设置代理
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)placeHolderAttrStr, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegate);
        CFRelease(delegate);
        
        // 插入空的占位符
        [attributeStr insertAttributedString:placeHolderAttrStr atIndex:12];
        
        // frame 生成工厂
        CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributeStr);
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, self.bounds);
        NSInteger length = attributeStr.length;
        CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, length), path, NULL);
        CTFrameDraw(frame, context);
        
        UIImage * image = [UIImage imageNamed:@"orangeLevelIcon"];
        CGRect imgFrm = [self calculateImageRectWithFrame:frame];
        CGContextDrawImage(context,imgFrm, image.CGImage);
        CFRelease(frame);
        CFRelease(path);
        CFRelease(frameSetter);
}

-(CGRect)calculateImageRectWithFrame:(CTFrameRef)frame
{
    NSArray * arrLines = (NSArray *)CTFrameGetLines(frame);
    NSInteger count = [arrLines count];
    CGPoint points[count];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), points);
    for (int i = 0; i < count; i ++) {
        CTLineRef line = (__bridge CTLineRef)arrLines[i];
        NSArray * arrGlyphRun = (NSArray *)CTLineGetGlyphRuns(line);
        for (int j = 0; j < arrGlyphRun.count; j ++) {
            CTRunRef run = (__bridge CTRunRef)arrGlyphRun[j];
            NSDictionary * attributes = (NSDictionary *)CTRunGetAttributes(run);            CTRunDelegateRef delegate = (__bridge CTRunDelegateRef)[attributes valueForKey:(id)kCTRunDelegateAttributeName];
            if (delegate == nil) {
                continue;
            }
            NSDictionary * dic = CTRunDelegateGetRefCon(delegate);
            if (![dic isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            CGPoint point = points[i];
            CGFloat ascent;
            CGFloat descent;
            CGRect boundsRun;
            boundsRun.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
            boundsRun.size.height = ascent + descent;
            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            boundsRun.origin.x = point.x + xOffset;
            boundsRun.origin.y = point.y - descent;
            CGPathRef path = CTFrameGetPath(frame);
            CGRect colRect = CGPathGetBoundingBox(path);
            CGRect imageBounds = CGRectOffset(boundsRun, colRect.origin.x, colRect.origin.y);
            return imageBounds;
        }
    }
    return CGRectZero;
}


@end
