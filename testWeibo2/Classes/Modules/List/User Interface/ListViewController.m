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
@property(nonatomic, strong) IBOutlet ASTableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancleButton)];
    
    [super viewDidLoad];
    
    // attribute a string
    NSDictionary *attrs = @{
                            NSFontAttributeName: [UIFont systemFontOfSize:16.0f],
                            NSForegroundColorAttributeName: [UIColor redColor],
                            NSBackgroundColorDocumentAttribute: [UIColor blueColor],
                            NSBackgroundColorAttributeName: [UIColor grayColor],
                            };
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"cancle"
                                                                 attributes:attrs];
    
    ASTextNode *shuffleNode = [[ASTextNode alloc] init];
    shuffleNode.attributedString = string;
    
    // configure the button
    shuffleNode.userInteractionEnabled = YES; // opt into touch handling
    [shuffleNode addTarget:self
                     action:@selector(handleCancleButton)
           forControlEvents:ASControlNodeEventTouchUpInside];
    CGSize size = [shuffleNode measure:CGSizeMake(55, 55)];
    CGPoint origin = CGPointMake(10,10);

    shuffleNode.frame = (CGRect){ origin, size };
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:shuffleNode.view];
    self.navigationItem.rightBarButtonItem = leftItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:friendsCellIdentifier];
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
//                NSLog(@"%@", self.dataArray);
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

    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:friendsCellIdentifier];
    ListItem *item = self.dataArray[indexPath.row];
    if (item.headImage && item.nickName) {
        NSURL *url = [[NSURL alloc] initWithString:item.headImage];
        [cell.headImageView setImageWithURL:url placeholderImage:nil];
        cell.nickNameLabel.text = item.nickName;
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end
