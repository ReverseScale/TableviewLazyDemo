//
//  PackageCellConfigure.h
//  TableviewLazyDemo
//
//  Created by WhatsXie on 2017/6/23.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PackageCellConfigure <NSObject>

- (void)configureCellWithModel:(id)model;

@end
