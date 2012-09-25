//
//  VENotificationViewController.h
//  VENotificationView
//
//  Created by Yamazaki Mitsuyoshi on 9/25/12.
//  Copyright (c) 2012 Yamazaki Mitsuyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VENotificationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
