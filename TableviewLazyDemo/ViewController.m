//
//  ViewController.m
//  TableviewLazyDemo
//
//  Created by WhatsXie on 2017/6/23.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import "PackageDataSource.h"
#import "TestTableViewCell.h"

@interface ViewController ()<UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) PackageDataSource *welDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupTableView];
    [self setWelTableView];
    
    [self.welDataSource addModels:@[@{@"0":@"我是第一行"},@{@"1":@"我是第二行"}]];
    // reload
//    [self.table reloadData];
}
- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:@"TestTableViewCell"];
}

- (void)setWelTableView {
    self.welDataSource = [[PackageDataSource alloc] initWithIdentifier:@"TestTableViewCell" configureBlock:^(TestTableViewCell *cell, id model, NSIndexPath *indexPath) {
        cell.wordLabel.text = [model objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self.welDataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
