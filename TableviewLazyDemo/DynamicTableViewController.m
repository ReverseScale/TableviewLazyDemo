//
//  DynamicTableViewController.m
//  TableviewLazyDemo
//
//  Created by WhatsXie on 2017/8/23.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "DynamicTableViewController.h"
#import "CustomTableViewCell.h"

@interface DynamicTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, copy) NSArray *arrayList;
@property (nonatomic, copy) NSDictionary *dicHight;

@end

@implementation DynamicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createData];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data
- (void)createData {
    // 单 Section 数据
    //    self.arrayList = @[@[@"0",@"1",@"2",@"3",@"4",@"5"]];
    
    // 多 Section 数据
    self.arrayList = @[@[@"0",@"1",@"2"], @[@"3",@"4",@"5"]];
    
    // 详细数据源
    self.dicHight = @{@"0":@135,@"1":@60,@"2":@60,@"3":@130,@"4":@135,@"5":@60};
}

#pragma mark - Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.estimatedRowHeight = 44;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate、UITableViewDataSource
#pragma mark #required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arrCount = self.arrayList[section];
    return arrCount.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 0 ? [self createSystemTableCellWith:tableView atIndexPath:indexPath] : [self createCustomTableCellWith:tableView atIndexPath:indexPath];
}

#pragma mark #optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayList.count;
}

// TableView header&footer
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [UIView new];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [UIView new];
    return footerView;
}
// Cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.arrayList[indexPath.section][indexPath.row];
    return [self.dicHight[key] floatValue];
}

#pragma mark - create func
- (UITableViewCell *)createSystemTableCellWith:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    static NSString *systemCellIdentifier = @"SystemTableViewCell";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:systemCellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:systemCellIdentifier];
        cell.textLabel.text = [NSString stringWithFormat:@"System-%ld:%ld", indexPath.section ,indexPath.row];
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }
    return cell;
}

- (UITableViewCell *)createCustomTableCellWith:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    static NSString *customCellIdentifier = @"CustomTableViewCell";
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil){
        cell = (CustomTableViewCell *)[[[NSBundle  mainBundle] loadNibNamed:customCellIdentifier owner:self options:nil] lastObject];
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    }
    return cell;
}

@end
