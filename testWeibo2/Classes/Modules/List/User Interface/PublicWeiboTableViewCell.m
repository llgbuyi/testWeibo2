//
//  PublicWeiboTableViewCell.m
//  testWeibo2
//
//  Created by lili on 15-1-5.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "PublicWeiboTableViewCell.h"

@interface PublicWeiboTableViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headImageWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headImageSpaceToLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headImageLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelTrailing;

@end

@implementation PublicWeiboTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.contentWeibo.numberOfLines = 0;
    self.contentWeibo.lineBreakMode = NSLineBreakByCharWrapping;

//要设置preferredMaxLayoutWidth
    self.contentWeibo.preferredMaxLayoutWidth = [[UIScreen mainScreen] bounds].size.width - self.headImageLeading.constant - self.headImageWidth.constant - self.headImageSpaceToLabel.constant - self.labelTrailing.constant;
    if ([self respondsToSelector:@selector(layoutMargins)]) {
        self.contentWeibo.preferredMaxLayoutWidth = [[UIScreen mainScreen] bounds].size.width - self.headImageLeading.constant - self.headImageWidth.constant - self.headImageSpaceToLabel.constant - self.labelTrailing.constant - self.layoutMargins.left - self.layoutMargins.right;
        
    }
//    NSLog(@"preferredMaxLayoutWidth is %f",self.contentWeibo.preferredMaxLayoutWidth);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews {
    [super layoutSubviews];
//    NSLog(@"size is %@",NSStringFromCGSize(self.contentWeibo.bounds.size));
}

@end
