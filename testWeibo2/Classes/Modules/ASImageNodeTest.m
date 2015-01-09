//
//  ASImageNodeTest.m
//  testWeibo2
//
//  Created by lili on 15-1-8.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "ASImageNodeTest.h"
static CGFloat const kASDKLogoAspectRatio = 2.79;

@implementation ASImageNodeTest

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

/**
 
kASDKLogoAspectRatio是图片的高度/宽度的ratio,为的是让原图像等比例缩放
 
**/

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    if (constrainedSize.width > 0.0) {
        return CGSizeMake(constrainedSize.width, constrainedSize.width / kASDKLogoAspectRatio);
    } else if (constrainedSize.height > 0.0) {
        return CGSizeMake(constrainedSize.height * kASDKLogoAspectRatio, constrainedSize.height);
    }
    return CGSizeZero;
}

@end
