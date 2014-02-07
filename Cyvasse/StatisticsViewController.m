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

- (void)setBackgroundColors;
- (float)calculateHealthBarWidth:(float)width ForHealth:(int)health AndMaxHealth:(int)maxHealth;

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

		[[self StatsV] setPictureView:[[UIImageView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_PICTURE_X, STATISTICS_VIEW_PICTURE_Y, STATISTICS_VIEW_PICTURE_SIZE, STATISTICS_VIEW_PICTURE_SIZE)]];
		[[[self StatsV] PictureView] setImage:[UIImage imageNamed:picture]];

		[[self StatsV] setNameView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_NAME_X, STATISTICS_VIEW_NAME_Y, STATISTICS_VIEW_NAME_WIDTH, STATISTICS_VIEW_NAME_HEIGHT)]];
		[[[self StatsV] NameView] setText:name];

		[[self StatsV] setHealthView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_HEALTH_X, STATISTICS_VIEW_HEALTH_Y, STATISTICS_VIEW_HEALTH_WIDTH, STATISTICS_VIEW_HEALTH_HEIGHT)]];
		[[[self StatsV] HealthView] setText:@"Health:"];

		[[self StatsV] setHealthValueView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_HEALTH_VALUE_X, STATISTICS_VIEW_HEALTH_VALUE_Y, STATISTICS_VIEW_HEALTH_VALUE_WIDTH, STATISTICS_VIEW_HEALTH_VALUE_HEIGHT)]];

		NSString *healthString = [NSString stringWithFormat:@"%d", health];
		NSString *maxHealthString = [NSString stringWithFormat:@"%d", maxHealth];
		healthString = [healthString stringByAppendingString:@" / "];
		healthString = [healthString stringByAppendingString:maxHealthString];

		[[[self StatsV] HealthValueView] setText:healthString];

		[[self StatsV] setHealthBar:[[UIView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_HEALTH_BAR_X, STATISTICS_VIEW_HEALTH_BAR_Y, [self calculateHealthBarWidth:STATISTICS_VIEW_HEALTH_BAR_WIDTH ForHealth:health AndMaxHealth:maxHealth], STATISTICS_VIEW_HEALTH_BAR_HEIGHT)]];

		[[self StatsV] setHealthBarBackground:[[UIView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_HEALTH_BAR_X, STATISTICS_VIEW_HEALTH_BAR_Y, STATISTICS_VIEW_HEALTH_BAR_WIDTH, STATISTICS_VIEW_HEALTH_BAR_HEIGHT)]];

		[[self StatsV] setAttackView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_ATTACK_X, STATISTICS_VIEW_ATTACK_Y, STATISTICS_VIEW_ATTACK_WIDTH, STATISTICS_VIEW_ATTACK_HEIGHT)]];

		[[self StatsV] setAttackValueView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_ATTACK_VALUE_X, STATISTICS_VIEW_ATTACK_VALUE_Y, STATISTICS_VIEW_ATTACK_VALUE_WIDTH, STATISTICS_VIEW_ATTACK_VALUE_HEIGHT)]];

		[[self StatsV] setDefenseView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_DEFENSE_X, STATISTICS_VIEW_DEFENSE_Y, STATISTICS_VIEW_DEFENSE_WIDTH, STATISTICS_VIEW_DEFENSE_HEIGHT)]];

		[[self StatsV] setDefenseValueView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_DEFENSE_VALUE_X, STATISTICS_VIEW_DEFENSE_VALUE_Y, STATISTICS_VIEW_DEFENSE_VALUE_WIDTH, STATISTICS_VIEW_DEFENSE_VALUE_HEIGHT)]];

		[[self StatsV] setMovementView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_MOVEMENT_X, STATISTICS_VIEW_MOVEMENT_Y, STATISTICS_VIEW_MOVEMENT_WIDTH, STATISTICS_VIEW_MOVEMENT_HEIGHT)]];

		[[self StatsV] setMovementValueView:[[UITextView alloc] initWithFrame:CGRectMake(STATISTICS_VIEW_MOVEMENT_VALUE_X, STATISTICS_VIEW_MOVEMENT_VALUE_Y, STATISTICS_VIEW_MOVEMENT_VALUE_WIDTH, STATISTICS_VIEW_MOVEMENT_VALUE_HEIGHT)]];

		[self setBackgroundColors];

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

- (void)setBackgroundColors
{
	[[[self StatsV] PictureView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] NameView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] HealthView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] HealthValueView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] HealthBar] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] AttackView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] AttackValueView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] DefenseView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] DefenseValueView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] MovementView] setBackgroundColor:[UIColor clearColor]];
	[[[self StatsV] MovementValueView] setBackgroundColor:[UIColor clearColor]];
}

- (float)calculateHealthBarWidth:(float)width ForHealth:(int)health AndMaxHealth:(int)maxHealth
{
	return width * ( health / maxHealth );
}

@end
