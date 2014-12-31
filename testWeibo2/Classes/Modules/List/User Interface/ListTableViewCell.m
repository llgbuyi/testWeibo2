//
//  ListTableViewCell.m
//  testWeibo2
//
//  Created by lili on 14-12-30.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (id)init {
    self = [[[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:nil options:nil] firstObject];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
