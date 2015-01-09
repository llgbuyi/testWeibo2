//
//  ASDisplayViewController.m
//  testWeibo2
//
//  Created by lili on 15-1-8.
//  Copyright (c) 2015年 com.duowan.zpc. All rights reserved.
//

#import "ASDisplayViewController.h"
#import "ASImageNodeTest.h"
#import "ASTextNodeTest.h"
#import "ASCustomNode.h"

@interface ASDisplayViewController ()

@end

@implementation ASDisplayViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(handleCancleButton)]];
    
    ASImageNodeTest *imageNode = [[ASImageNodeTest alloc] init];
//    ASImageNode *imageNode = [[ASImageNode alloc] init];
    imageNode.image = [UIImage imageNamed:@"logo.png"];
    CGFloat width = CGRectGetWidth([self.view bounds]) - 2 * 10;
    
    CGSize constrainedSize = CGSizeMake(width, 20);
 
    
/**
 调用顺序：measure -- calculateSizeThatFits（ASImageNodeTest没有实现该方法的话调用默认的，默认的会返回该imageNode的image的真实的高度和宽度）
**/
    
    CGSize imageSize = [imageNode measure:constrainedSize];
    
    imageNode.frame = CGRectMake(0, 74, imageSize.width, imageSize.height);
    
    [self.view addSubview:imageNode.view];
    
    UIFont *font = [UIFont fontWithName:nil size:18.0];
//    ASTextNode *textNode = [[ASTextNode alloc] init];
    ASTextNodeTest *textNode = [[ASTextNodeTest alloc] init];
    NSString *text = @" 调用顺序：measure -- calculateSizeThatFits（ASImageNodeTest没有实现该方法的话调用默认的，默认的会返回该imageNode的image的真实的高度和宽度）";
    
    NSDictionary *dict = @{NSFontAttributeName : font, NSForegroundColorAttributeName: [UIColor blueColor], NSLigatureAttributeName: [NSNumber numberWithInt:2]};
    
    textNode.attributedString = [[NSAttributedString alloc] initWithString:text attributes:dict];
    CGSize textSize = [textNode measure:CGSizeMake(width, FLT_MAX)];
    textNode.frame = CGRectMake(10, 74 + imageSize.height + 10, width, textSize.height);
    
    [self.view addSubview:textNode.view];
    
    
    ASCustomNode *customNode = [[ASCustomNode alloc] init];
    customNode.opaque = NO; //否则会有默认的黑色背景
    customNode.frame = CGRectMake(0, CGRectGetMaxY(textNode.frame) + 10, 100, 100);
    [self.view addSubview:customNode.view];
    
}

- (void)handleCancleButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
