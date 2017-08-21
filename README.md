# TableviewLazyDemo

![image](http://og1yl0w9z.bkt.clouddn.com/17-6-30/22248406.jpg)

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/download-381K-brightgreen.svg
) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

作为开发中使用率最高的控件，UITableView 又有许多重复的代码，实际常用到的就那几处代理功能，所以封装了一套简易的 TableView 工具，前期只做了常用的功能，支持根据业务需求扩展。

| 名称 |1.列表页 |2.展示页 |
| ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-6/44848621.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-6/19750327.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | TableviewLazy封装创建 |

## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.使用Block回调机制，效率高，结构清晰
* 4.支持XIB/纯代码方式实现
* 5.具备较高自定义性

## Requirements 要求
* iOS 7+
* Xcode 8+

## Usage 使用方法
### 第一步 将工具文件夹拖入工程文件
文件夹：PackageTableView 
### 第二部 配置方法
#### 1.引入头文件
```
// 工具头文件
#import "PackageDataSource.h"、
// 自定义 Cell 头文件
#import "TestTableViewCell.h"
```
#### 2.签代理、声明属性
```
@interface ViewController ()<UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) PackageDataSource *welDataSource;
@end
```
#### 3.放置TableView
```
- (void)setupTableView {
self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
self.tableView.backgroundColor = [UIColor whiteColor];
self.tableView.estimatedRowHeight = 44;
self.tableView.rowHeight = UITableViewAutomaticDimension;
[self.view addSubview:self.tableView];

[self.tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:@"TestTableViewCell"];
}
```
#### 4.实现代理传数据
```
- (void)setWelTableView {
self.welDataSource = [[PackageDataSource alloc] initWithIdentifier:@"TestTableViewCell" configureBlock:^(TestTableViewCell *cell, id model, NSIndexPath *indexPath) {
cell.wordLabel.text = [model objectForKey:[NSString stringWithFormat:@"%ld", indexPath.row]];
}];

self.tableView.delegate = self;
self.tableView.dataSource = self.welDataSource;
}
```
#### 5.viewDidLoad 中实现
```
- (void)viewDidLoad {
[super viewDidLoad];
// Do any additional setup after loading the view, typically from a nib.

[self setupTableView];
[self setWelTableView];

[self.welDataSource addModels:@[@{@"0":@"我是第一行"},@{@"1":@"我是第二行"}]];
// reload
//    [self.table reloadData];
}
```

注：自定义 Cell 文件见 Demo。

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
TableviewLazyDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io

