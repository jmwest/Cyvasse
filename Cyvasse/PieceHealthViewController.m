//
//  PieceHealthViewController.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "PieceHealthViewController.h"

@interface PieceHealthViewController ()

@end

@implementation PieceHealthViewController

@synthesize PHView = _PHView;

- (id)initWithFrame:(CGRect)frame AndColor:(UIColor *)color
{
	self = [super init];
	if (self)
	{
		[self setPHView:[[PieceHealthView alloc] initWithFrame:frame]];
		[self setView:[self PHView]];

		[[self PHView] setBackgroundColor:[UIColor blackColor]];
		[self setHealthBarColor:color];

		[[self PHView] addSubview:[[self PHView] HealthBar]];
	}
	return self;
}

- (void)setHealthBarColor:(UIColor *)color
{
	[[[self PHView] HealthBar] setBackgroundColor:color];
}

- (void)setHealthBarLength:(int)currentHealth :(int)maxHealth
{
	double newWidth;

	newWidth = ( currentHealth / maxHealth ) * [[self PHView] frame].size.width;

	[[[self PHView] HealthBar] setFrame:CGRectMake([[[self PHView] HealthBar] frame].origin.x,
												   [[[self PHView] HealthBar] frame].origin.y,
												   newWidth,
												   [[[self PHView] HealthBar] frame].size.height)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
