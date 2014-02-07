//
//  StatisticsViewController.m
//  Cyvasse
//
//  Created by John West on 2/6/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "StatisticsViewController.h"
#import "GlobalConstants.h"

@interface StatisticsViewController ()

@end

@implementation StatisticsViewController

@synthesize StatsV = _StatsV;

- (id)initWithFrame:(CGRect)frame
			Picture:(NSString *)picture
			   Name:(NSString *)name
			 Health:(int)health
		  MaxHealth:(int)maxHealth
			 Attack:(int)attack
			Defense:(int)defense
		   Movement:(int)movement
{
	self = [super init];
	if (self)
	{
		[self setStatsV:[[StatisticsView alloc] initWithFrame:frame]];

		[[self StatsV] setPictureView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:picture]]];

		[[self StatsV] setNameView:[[UITextView alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]]

		[self setView:[self StatsV]];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
