//
//  PublicWeiboTableViewCell.m
//  testWeibo2
//
//  Created by lili on 15-1-5.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "PublicWeiboTableViewCell.h"

@implementation PublicWeiboTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.contentWeibo.numberOfLines = 0;
    self.contentWeibo.lineBreakMode = NSLineBreakByCharWrapping;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
