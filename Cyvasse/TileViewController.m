//
//  TileViewController.m
//  Cyvasse
//
//  Created by John West on 1/4/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "TileViewController.h"
#import "GlobalConstants.h"

@interface TileViewController ()

- (TileView *)TileV;

@property (strong, nonatomic) UIColor *MovementColor;
@property (strong, nonatomic) UIColor *AttackColor;

@property (strong, nonatomic) UIColor *PlainsColor;
@property (strong, nonatomic) UIColor *MountainColor;
@property (strong, nonatomic) UIColor *RiverColor;

@end

@implementation TileViewController

@synthesize TileV = _TileV;

#pragma mark - Init

#pragma mark Columns and Rows must be 0 - 9, inclusive
- (id)initWithColumn:(int)column AndRow:(int)row
{
	CGRect rect = CGRectMake(FIRST_COLUMN_X + (column * TILE_SIZE),
							 FIRST_COLUMN_Y + (row * TILE_SIZE),
							 TILE_SIZE,
							 TILE_SIZE);

	self = [self initWithFrame:rect];

	return self;
}

- (id)initWithFrame:(CGRect)rect
{
	self = [super init];
	if (self)
	{
		[self setTileV:[[TileView alloc] initWithFrame:rect]];

		[self setMovementColor:[UIColor colorWithRed:0.3f green:0.5f blue:0.9f alpha:0.2f]];
		[self setAttackColor:[UIColor colorWithRed:0.9f green:0.3f blue:0.3f alpha:0.2f]];

		[self setPlainsColor:[UIColor greenColor]];
		[self setMountainColor:[UIColor darkGrayColor]];
		[self setRiverColor:[UIColor blueColor]];
	}
	return self;
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self setView:[self TileV]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (TileView *)TileV
{
	if (!_TileV)
	{
		_TileV = [[TileView alloc] init];
	}
	return _TileV;
}

#pragma mark - Setters and Getters

- (void)setTilePassability:(Terrain)terrain
{
	[[self TileV] setPassability:terrain];

	switch (terrain)
	{
		case DefaultT:
			[[self TileV] setBackgroundColor:[UIColor whiteColor]];
			break;

		case Plains:
			[[self TileV] setBackgroundColor:[self PlainsColor]];
			break;

		case Mountain:
			[[self TileV] setBackgroundColor:[self MountainColor]];
			break;

		case River:
			[[self TileV] setBackgroundColor:[self RiverColor]];
			break;

		default:
			break;
	}
}

- (void)setTileOverlay:(Highlight)highlight
{
	switch (highlight)
	{
		case DefaultH:
			[[[self TileV] ColorOverlay] setBackgroundColor:[UIColor clearColor]];
			break;

		case UnHighlighted:
			[[[self TileV] ColorOverlay] setBackgroundColor:[UIColor clearColor]];
			break;

		case Movement:
			[[[self TileV] ColorOverlay] setBackgroundColor:[self MovementColor]];
			break;

		case Attack:
			[[[self TileV] ColorOverlay] setBackgroundColor:[self AttackColor]];
			break;

		default:
			break;
	}
}

- (void)setTileOccupied:(TileOccupied)tileOccupied
{
	[[self TileV] setOccupied:tileOccupied];
}

- (void)setTileColumn:(int)column AndRow:(int)row
{
	[[self TileV] setColumn:column];
	[[self TileV] setRow:row];
}

- (int)getTileColumn
{
	return [[self TileV] Column];
}

- (int)getTileRow
{
	return [[self TileV] Row];
}

#pragma mark -

- (TileOccupied)checkTileOccupied
{
	return [[self TileV] Occupied];
}

#pragma mark -

@end
