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

- (TileImageView *)TileIV;

@property (strong, nonatomic) UIColor *MovementColor;
@property (strong, nonatomic) UIColor *AttackColor;

@property (strong, nonatomic) UIColor *PlainsColor;
@property (strong, nonatomic) UIColor *MountainColor;
@property (strong, nonatomic) UIColor *RiverColor;

@end

@implementation TileViewController

@synthesize TileIV = _TileIV;
@synthesize TapRecognizer;

@synthesize MovementColor = _MovementColor;
@synthesize AttackColor = _AttackColor;
@synthesize PlainsColor = _PlainsColor;
@synthesize MountainColor = _MountainColor;
@synthesize RiverColor = _RiverColor;

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
		[self setTileIV:[[TileImageView alloc] initWithFrame:rect]];

		[self setMovementColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f]];
//		[self setMovementColor:[UIColor colorWithRed:0.98f green:0.98f blue:0.6f alpha:0.4f]];
//		[self setMovementColor:[UIColor colorWithRed:0.69f green:0.769f blue:0.8706f alpha:0.3f]];
		[self setAttackColor:[UIColor colorWithRed:0.94f green:0.5f blue:0.5f alpha:0.3f]];

		[self setPlainsColor:[UIColor greenColor]];
		[self setMountainColor:[UIColor darkGrayColor]];
		[self setRiverColor:[UIColor blueColor]];

		[self setTapRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tileTapGesture)]];
		[self addTapGestureToTile:[self TapRecognizer]];
	}
	return self;
}

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self setView:[self TileIV]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (TileImageView *)TileIV
{
	if (!_TileIV)
	{
		_TileIV = [[TileImageView alloc] init];
	}
	return _TileIV;
}

#pragma mark - Tap Gestures

- (void)tileTapGesture
{
	switch ([[self TileIV] Passability])
	{
		case Plains:
			[self setTilePassability:Mountain];
			break;

		case Mountain:
			[self setTilePassability:River];
			break;

		case River:
			[self setTilePassability:Plains];
			break;

		default:
			break;
	}
}

- (void)addTapGestureToTile:(UITapGestureRecognizer *)gesture
{
	[gesture setNumberOfTapsRequired:1];
	[gesture setNumberOfTouchesRequired:1];
	[[self TileIV] addGestureRecognizer:gesture];
	[gesture setDelegate:self];
}

- (void)removeTapGestureFromTile:(UITapGestureRecognizer *)gesture
{
	[[self TileIV] removeGestureRecognizer:gesture];
}

#pragma mark - Setters and Getters

- (void)setTilePassability:(Terrain)terrain
{
	[[self TileIV] setPassability:terrain];

	switch (terrain)
	{
		case DefaultT:
			[[self TileIV] setBackgroundColor:[UIColor whiteColor]];
			break;

		case Plains:
			[[self TileIV] setBackgroundColor:[self PlainsColor]];
			break;

		case Mountain:
			[[self TileIV] setBackgroundColor:[self MountainColor]];
			break;

		case River:
			[[self TileIV] setBackgroundColor:[self RiverColor]];
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
			[[[self TileIV] ColorOverlay] setBackgroundColor:[UIColor clearColor]];
			break;

		case UnHighlighted:
			[[[self TileIV] ColorOverlay] setBackgroundColor:[UIColor clearColor]];
			break;

		case Movement:
			[[[self TileIV] ColorOverlay] setBackgroundColor:[self MovementColor]];
			break;

		case Attack:
			[[[self TileIV] ColorOverlay] setBackgroundColor:[self AttackColor]];
			break;

		default:
			break;
	}
}

- (void)setTileOccupied:(TileOccupied)tileOccupied
{
	[[self TileIV] setOccupied:tileOccupied];
}

- (void)setTileColumn:(int)column AndRow:(int)row
{
	[[self TileIV] setColumn:column];
	[[self TileIV] setRow:row];
}

- (int)getTileColumn
{
	return [[self TileIV] Column];
}

- (int)getTileRow
{
	return [[self TileIV] Row];
}

#pragma mark -

- (TileOccupied)checkTileOccupied
{
	return [[self TileIV] Occupied];
}

#pragma mark -

@end
