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

@interface PublicWeiboViewController ()

@property(nonatomic, strong)IBOutlet UITableView *tableView;
@property(nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong) UITableViewCell *prototypeCell;

@end

@implementation PublicWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancleButton)];

    [self.tableView registerNib:[UINib nibWithNibName:@"PublicWeiboTableViewCell" bundle:nil] forCellReuseIdentifier:publicWeiboCellIdentifier];
    self.prototypeCell  = [self.tableView dequeueReusableCellWithIdentifier:@"PublicWeiboTableViewCell"];
    
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
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    ListItem *item = self.dataArray[indexPath.row];
    NSURL *url = [NSURL URLWithString:item.headImage];
    if(item.headImage && item.contentWeibo){
//        [cell.imageView setImageWithURL:url placeholderImage:nil];
        cell.textLabel.text = item.contentWeibo;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
 
    }
    return cell;
    
//    PublicWeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:publicWeiboCellIdentifier forIndexPath:indexPath];
//    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
//    NSURL *url = [NSURL URLWithString:item.headImage];
//    [cell.imageView setImageWithURL:url placeholderImage:nil];
//    cell.textLabel.text = item.contentWeibo;
//    cell.te.numberOfLines = 0;
//    [cell.headView setImageWithURL:url placeholderImage:nil];
//    cell.contentWeibo.text = item.contentWeibo;
//    cell.contentWeibo.numberOfLines = 0;
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    PublicWeiboTableViewCell *cell = (PublicWeiboTableViewCell *)self.prototypeCell;
//    cell.contentWeibo.text = [self.dataArray objectAtIndex:indexPath.row];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    NSLog(@"h=%f", size.height + 1);
//    return 1  + size.height;
//}

- (void)loadData {
    [[WeiboLogin shareInstance] requestPublicWeiboWithFinishBlock:^(NSArray *result, NSError *error) {
        if (!error) {
            self.dataArray = result;
            [self.tableView reloadData];
        }
    }];
}
@end
