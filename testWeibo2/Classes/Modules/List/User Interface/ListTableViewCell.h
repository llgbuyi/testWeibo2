//
//  ListTableViewCell.h
//  testWeibo2
//
//  Created by lili on 14-12-30.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *cellIdentifier = @"listCellIdentifier";

@interface ListTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *headImageView;
@property (nonatomic, strong) IBOutlet UILabel *nickNameLabel;

@end
