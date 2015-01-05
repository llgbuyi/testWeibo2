//
//  PublicWeiboTableViewCell.h
//  testWeibo2
//
//  Created by lili on 15-1-5.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *publicWeiboCellIdentifier = @"publicWeiboCellIdentifier";

@interface PublicWeiboTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *contentWeibo;
@property (nonatomic, strong) IBOutlet UIImageView *headView;


@end
