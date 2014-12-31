//
//  ListTableViewCell.h
//  testWeibo2
//
//  Created by lili on 14-12-30.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *friendsCellIdentifier = @"friendsCellIdentifier";
static NSString *publicWeiboCellIdentifier = @"publicWeiboCellIdentifier";

@interface ListTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *headImageView;
@property (nonatomic, strong) IBOutlet UILabel *nickNameLabel;

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, strong) IBOutlet UIImageView *headImageView2;
@property (nonatomic, strong) IBOutlet UILabel *nickNameLabel2;
@property (nonatomic, strong) IBOutlet UILabel *contentLabel;

@end
