//
//  ListViewController2.m
//  testWeibo2
//
//  Created by lili on 15-1-5.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "ListViewController2.h"
#import "WeiboLogin.h"
#import "ListItem.h"

@interface ListViewController2 ()<ASTableViewDataSource, ASTableViewDelegate>
@property(nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) ASTableView *tableView;

@end

@implementation ListViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
    
    self.tableView = [[ASTableView alloc] initWithFrame:CGRectMake(0, 64, 320, 502)];
    
    self.tableView.asyncDelegate = self;
    self.tableView.asyncDataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self loadData];
}


- (void)loadData {
    [[WeiboLogin shareInstance] requestPublicWeiboWithFinishBlock:^(NSArray *result, NSError *error) {
        if (!error) {
            self.dataArray = result;
            [self.tableView reloadData];
//            NSLog(@"%@", self.dataArray);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)handleCancleButton {
    [self dismissViewControllerAnimated:YES completion:nil];
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
        return 10;
    }
}



- (ASCellNode *)tableView:(ASTableView *)tableView nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
    ASTextCellNode *node = [[ASTextCellNode alloc] init];
    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    if (item.contentWeibo) {
        node.text = item.contentWeibo;
    }
    
    return node;
}


 

@end