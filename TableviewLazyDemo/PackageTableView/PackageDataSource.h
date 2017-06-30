//
//  PackageDataSource.h
//  TableviewLazyDemo
//
//  Created by WhatsXie on 2017/6/23.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PackageCellConfigure.h"

typedef void (^CellConfigureBefore)(id cell, id model, NSIndexPath * indexPath);


IB_DESIGNABLE
@interface PackageDataSource : NSObject <UITableViewDataSource,UICollectionViewDataSource>

//--------- For Code
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(CellConfigureBefore)before;

//--------- For StoryBoard
@property (nonatomic, strong) IBInspectable NSString *cellIdentifier;
@property (nonatomic, copy) CellConfigureBefore cellConfigureBefore;

//---------Public
- (void)addModels:(NSArray *)models;
- (id)modelsAtIndexPath:(NSIndexPath *)indexPath;



@end
