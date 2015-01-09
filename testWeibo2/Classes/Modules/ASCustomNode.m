//
//  ASCustomNode.m
//  testWeibo2
//
//  Created by lili on 15-1-9.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "ASCustomNode.h"

#define iconSide 100.0

@implementation ASCustomNode

+ (void)drawRect:(CGRect)bounds
  withParameters:(id<NSObject>)parameters
     isCancelled:(asdisplaynode_iscancelled_block_t)isCancelledBlock
   isRasterizing:(BOOL)isRasterizing{
    
//    usleep( (long)(0.8 * USEC_PER_SEC) ); // artificial delay of 0.8s

    [[UIColor greenColor] setStroke];

    CGRect frame = CGRectMake(0.f, 0.f, iconSide, iconSide);
//    CGRect strokeFrame = CGRectInset(frame, 1.0, 1.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:iconSide / 2.f];
    [path setLineWidth:1.0];
    [path stroke];
    
}


- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    return CGSizeMake(iconSide, iconSide);
}

@end
