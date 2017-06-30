//
//  PackageTableDelegate.h
//  TableviewLazyDemo
//
//  Created by WhatsXie on 2017/6/23.
//  Copyright © 2017年 StevenXie. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PackageTableDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, weak) IBOutlet id <UITableViewDelegate>viewController;

@end
