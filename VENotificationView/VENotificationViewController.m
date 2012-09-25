//
//  VENotificationViewController.m
//  VENotificationView
//
//  Created by Yamazaki Mitsuyoshi on 9/25/12.
//  Copyright (c) 2012 Yamazaki Mitsuyoshi. All rights reserved.
//

#import "VENotificationViewController.h"

#import "VENotificationView.h"

static CGFloat const _kVENotificationViewDefaultHeight = 32.0f;
static NSTimeInterval const _kVENotificationViewAnimateDuration = 0.3f;

@interface VENotificationViewController ()
@end

@implementation VENotificationViewController

@synthesize tableView;
@synthesize notificationView;
@synthesize notificationLabel;

#pragma mark - Accessor
- (void)setNotificationViewHeight:(CGFloat)height {
	
	if (height < 0.0f || height > self.view.bounds.size.height) {
		NSLog(@"Notification view doesn't supporse to be %f height", height);
		return;
	}
	
	_notificationViewHeight = height;
}

#pragma mark - Lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	if (self.tableView == nil) {
		
		_notificationViewHeight = (_notificationViewHeight == 0.0f) ? _kVENotificationViewDefaultHeight : _notificationViewHeight;
		
		self.view.autoresizesSubviews = YES;
		
		self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
		self.tableView.delegate = self;
		self.tableView.dataSource = self;
		self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		
		[self.view addSubview:self.tableView];
		
		CGRect notificationViewRect = CGRectMake(0.0f, -_notificationViewHeight, self.view.bounds.size.width, _notificationViewHeight);
		self.notificationView = [[VENotificationView alloc] initWithFrame:notificationViewRect];
		self.notificationView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
		self.notificationView.contentMode = UIViewContentModeScaleAspectFit;
		
		[self.view addSubview:self.notificationView];
		
		CGRect notificationLabelRect = self.notificationView.bounds;
		notificationLabelRect.size.height -= kNotificationViewBottomEdgeHeight;
		
		self.notificationLabel = [[UILabel alloc] initWithFrame:notificationLabelRect];
		self.notificationLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		self.notificationLabel.textAlignment = UITextAlignmentCenter;
		self.notificationLabel.textColor = [UIColor colorWithWhite:0.15f alpha:1.0f];
		self.notificationLabel.backgroundColor = [UIColor clearColor];
		self.notificationLabel.font = [UIFont boldSystemFontOfSize:16.0f];
		self.notificationLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		self.notificationLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
		
		[self.notificationView addSubview:self.notificationLabel];
	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];

	self.tableView = nil;
	self.notificationView = nil;
	self.notificationLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - Notification View
- (void)toggleNotificationView:(BOOL)animated {
	
	NSTimeInterval animateDuration = (animated) ? _kVENotificationViewAnimateDuration : 0.0f;
	
	[UIView animateWithDuration:animateDuration animations:^(void) {
		CGRect notificationViewRect = self.notificationView.frame;
		notificationViewRect.origin.y = (notificationViewRect.origin.y < 0.0f) ? 0.0f : -_notificationViewHeight;
		[self.notificationView setFrame:notificationViewRect];
	}];
}

@end
