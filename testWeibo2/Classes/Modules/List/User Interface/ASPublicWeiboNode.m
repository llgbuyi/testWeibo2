//
//  ASPublicWeiboNode.m
//  testWeibo2
//
//  Created by lili on 15-1-7.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "ASPublicWeiboNode.h"


static const CGFloat kImageSize = 50.0f;
static const CGFloat kOuterPadding = 16.0f;
static const CGFloat kInnerPadding = 10.0f;

@interface ASPublicWeiboNode()

@property(nonatomic, strong) ASNetworkImageNode *headImageNode;
@property(nonatomic, strong) ASTextNode *contentWeiboTextNode;
@property(nonatomic, strong) ASDisplayNode *seperatorLine;

@end

@implementation ASPublicWeiboNode

- (instancetype)initWithUrl:(NSURL *)url andWithContent:(NSString *)content {
    
    self = [super init];
    if (self) {
        ASNetworkImageNode *headImageNode = [[ASNetworkImageNode alloc] init];
        headImageNode.URL = url;
        headImageNode.backgroundColor = [UIColor blackColor];
        self.headImageNode = headImageNode;
        [self addSubnode:self.headImageNode];
        
        ASTextNode *textNode = [[ASTextNode alloc] init];
        UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:12.0];
        textNode.attributedString = [[NSAttributedString alloc] initWithString:content attributes:@{
                                                                                                   NSFontAttributeName: font
            
                                                                                                   }];
        self.contentWeiboTextNode = textNode;
        [self addSubnode:self.contentWeiboTextNode];
        
        self.seperatorLine = [[ASDisplayNode alloc] init];
        self.seperatorLine.backgroundColor = [UIColor blueColor];
        [self addSubnode:self.seperatorLine];
    }
    
    return self;
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
    CGSize imageSize = CGSizeMake(kImageSize, kImageSize);
    CGSize textSize = [self.contentWeiboTextNode measure:CGSizeMake(constrainedSize.width - imageSize.width - kInnerPadding - 2 * kOuterPadding, constrainedSize.height)];
    CGFloat requiredHeight = MAX(imageSize.height, textSize.height);
    return CGSizeMake(constrainedSize.width, requiredHeight + 2 * kOuterPadding);
}

- (void)layout {
    self.headImageNode.frame = CGRectMake(kOuterPadding, kOuterPadding, kImageSize, kImageSize);
    CGSize textSize = self.contentWeiboTextNode.calculatedSize;
    self.contentWeiboTextNode.frame = CGRectMake(kOuterPadding + kInnerPadding + kImageSize, kOuterPadding, textSize.width, textSize.height);
    self.seperatorLine.frame = CGRectMake(0, 0, self.calculatedSize.width, 1);
}


@end
