//
//  PublicWeiboViewController.m
//  testWeibo2
//
//  Created by lili on 15-1-5.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "PublicWeiboViewController.h"
#import "PublicWeiboTableViewCell.h"
#import "ListItem.h"
#import "WeiboLogin.h"
#import "UIImageView+AFNetworking.h"

@interface PublicWeiboViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)IBOutlet UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong) UITableViewCell *prototypeCell;

@end

@implementation PublicWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancleButton)];

    [self.tableView registerNib:[UINib nibWithNibName:@"PublicWeiboTableViewCell" bundle:nil] forCellReuseIdentifier:publicWeiboCellIdentifier];
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:publicWeiboCellIdentifier];
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 44.0;
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)handleCancleButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.dataArray count] > 0)
    {
        return [self.dataArray count];
    }
    else {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PublicWeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publicWeiboCellIdentifier forIndexPath:indexPath];
    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString:item.headImage];
    [cell.headView setImageWithURL:url placeholderImage:nil];
    cell.contentWeibo.text = item.contentWeibo;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row: %ld ", indexPath.row);
    PublicWeiboTableViewCell *cell = (PublicWeiboTableViewCell *)self.prototypeCell;
    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    cell.contentWeibo.text = item.contentWeibo;
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
//    NSLog(@"h=%f", size.height + 1);
    return 1  + size.height;
//    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"estimate row: %ld", indexPath.row);

    return 44;
}


- (void)loadData {
    [[WeiboLogin shareInstance] requestPublicWeiboWithFinishBlock:^(NSArray *result, NSError *error) {
        if (!error) {
            self.dataArray = result;
            [self.tableView reloadData];
        }
    }];
}
@end
