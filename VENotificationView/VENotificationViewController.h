//
//  VENotificationViewController.h
//  VENotificationView
//
//  Created by Yamazaki Mitsuyoshi on 9/25/12.
//  Copyright (c) 2012 Yamazaki Mitsuyoshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VENotificationView;

@interface VENotificationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	CGFloat _notificationViewHeight;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) VENotificationView *notificationView;
@property (nonatomic, strong) UILabel *notificationLabel;

- (void)setNotificationViewHeight:(CGFloat)height;
- (void)toggleNotificationView:(BOOL)animated;

@end
