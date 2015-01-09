//
//  ASTextNodeTest.m
//  testWeibo2
//
//  Created by lili on 15-1-9.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "ASTextNodeTest.h"

@implementation ASTextNodeTest


+ (void)drawRect:(CGRect)bounds
  withParameters:(id<NSObject>)parameters
     isCancelled:(asdisplaynode_iscancelled_block_t)isCancelledBlock
   isRasterizing:(BOOL)isRasterizing{
    
    
    /**
     加了延迟之后，文字部分会先出现阴影，再出现文字！！！
     **/
    
    usleep( (long)(1.0 * USEC_PER_SEC) ); // artificial delay of 1.0
    
    [super drawRect:bounds withParameters:parameters isCancelled:isCancelledBlock isRasterizing:isRasterizing];

}


//- (instancetype)init
//{
//    if (self = [super init]) {
//        self.placeholderEnabled = YES;
//        self.placeholderFadesOut = YES;
//    }
//    return self;
//}


/**
 加了延迟之后，文字部分会先出现阴影，再出现文字！！！
 
 但是如果实现了placeholderImage方法，就不是阴影了，就会先出现placeholderImage返回的image，再出现文字！！！
 **/


- (UIImage *)placeholderImage
{
    CGSize size = self.calculatedSize;
    UIGraphicsBeginImageContext(size);
    [[UIColor grayColor] setFill];//将要填充path的区域的颜色
    [[UIColor redColor] setStroke];//笔画，画线的颜色
    
    UIRectFill((CGRect){CGPointZero, size});
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:(CGPoint){size.width, size.height}];
    [path stroke];
    
    [path moveToPoint:(CGPoint){size.width, 0.0}];
    [path addLineToPoint:(CGPoint){0.0, size.height}];
    [path stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
