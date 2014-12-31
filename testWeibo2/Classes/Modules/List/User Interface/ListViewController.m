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
    [self.tableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:friendsCellIdentifier];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;

    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)handleCancleButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadData {
    
    if(self.buttonType)
    {
        [[WeiboLogin shareInstance] requestFriendsWithFinishBlock:^(NSArray *result, NSError *error) {
            if (!error) {
                self.dataArray = result;
                [self.tableView reloadData];
                NSLog(@"%@", self.dataArray);
            }
        }];
    }
    else {
        [[WeiboLogin shareInstance] requestPublicWeiboWithFinishBlock:^(NSArray *result, NSError *error) {
            if (!error) {
                self.dataArray = result;
                [self.tableView reloadData];
                NSLog(@"%@", self.dataArray);
            }
        }];

    }
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
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:friendsCellIdentifier];
    ListItem *item = self.dataArray[indexPath.row];
    
    cell.contentLabel.numberOfLines = 0;

    if (self.buttonType){
        cell.view.hidden = YES;
        if(item.headImage != nil)
        {
            NSURL *url = [[NSURL alloc] initWithString:item.headImage];
            [cell.headImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"home_share"]];
        }
        
        cell.nickNameLabel.text = item.nickName;
        return cell;
    }
    else {
        cell.view.hidden = NO;
        cell.headImageView.hidden = YES;
        cell.nickNameLabel.hidden = YES;
        if(item.headImage != nil)
        {
            NSURL *url = [[NSURL alloc] initWithString:item.headImage];
            [cell.headImageView2 setImageWithURL:url placeholderImage:[UIImage imageNamed:@"home_share"]];
        }
        
        cell.nickNameLabel2.text = item.nickName;
        cell.contentLabel.text = item.contentWeibo;
        return cell;
    }
   
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.buttonType)
    {
        return 60;
    }
    else{
        return 100;
    }
}
@end
