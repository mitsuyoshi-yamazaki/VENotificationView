//
//  VENotificationView.m
//  VENotificationView
//
//  Created by Yamazaki Mitsuyoshi on 9/25/12.
//  Copyright (c) 2012 Yamazaki Mitsuyoshi. All rights reserved.
//

#import "VENotificationView.h"

static CGFloat const _kVENotificationViewBackgroundAlpha = 0.6f;

@implementation VENotificationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
		
	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.8f alpha:_kVENotificationViewBackgroundAlpha].CGColor);
	CGContextFillRect(context, CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height - kNotificationViewBottomEdgeHeight));
	
	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.44f alpha:1.0f].CGColor);
	CGContextFillRect(context, CGRectMake(0.0f, self.bounds.size.height - kNotificationViewBottomEdgeHeight, self.bounds.size.width, 1.0f));
	
	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:1.0f alpha:1.0f].CGColor);
	CGContextFillRect(context, CGRectMake(0.0f, self.bounds.size.height - kNotificationViewBottomEdgeHeight + 1.0f, self.bounds.size.width, 1.0f));
	
	NSUInteger edge = kNotificationViewBottomEdgeHeight - 2.0f;
	for (NSUInteger i = edge; i > 0; i--) {
		CGFloat alpha = _kVENotificationViewBackgroundAlpha * ((CGFloat)i / (CGFloat)edge);
		CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.8f alpha:alpha].CGColor);
		CGContextFillRect(context, CGRectMake(0.0f, self.bounds.size.height - i, self.bounds.size.width, 1.0f));
	}
}
	
@end
