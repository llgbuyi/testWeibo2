//
//  ListViewController.m
//  testWeibo2
//
//  Created by lili on 14-12-29.
//  Copyright (c) 2014年 com.duowan.zpc. All rights reserved.
//

#import "ListViewController.h"
#import "WeiboLogin.h"
#import "ListItem.h"
#import "UIImageView+AFNetworking.h"
#import "ListTableViewCell.h"

@interface ListViewController ()

@property(nonatomic, strong) NSArray *dataArray;
@property(nonatomic, strong) IBOutlet UITableView *tableView;


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancleButton)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)handleCancleButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadData {
    
    [[WeiboLogin shareInstance] requestFriendsWithFinishBlock:^(NSArray *result, NSError *error) {
        if (!error) {
            self.dataArray = result;
            [self.tableView reloadData];
            NSLog(@"%@", self.dataArray);
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
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
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    ListItem *item = self.dataArray[indexPath.row];
    if(item.headImage != nil)
    {
        NSURL *url = [[NSURL alloc] initWithString:item.headImage];
        [cell.headImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"home_share"]];
    }
    
    cell.nickNameLabel.text = item.nickName;
    return cell;
  
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
@end
