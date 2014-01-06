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
		[self setTileV:[[TileView alloc] initWithFrame:rect]];

		[self setMovementColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f]];
//		[self setMovementColor:[UIColor colorWithRed:0.98f green:0.98f blue:0.6f alpha:0.4f]];
//		[self setMovementColor:[UIColor colorWithRed:0.69f green:0.769f blue:0.8706f alpha:0.3f]];
		[self setAttackColor:[UIColor colorWithRed:0.94f green:0.5f blue:0.5f alpha:0.3f]];

		[self setPlainsColor:[UIColor greenColor]];
		[self setMountainColor:[UIColor darkGrayColor]];
		[self setRiverColor:[UIColor blueColor]];

		[self addTapGestureToTile];
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

#pragma mark - Tap Gestures

- (void)tileTapGesture:(UITapGestureRecognizer *)gesture
{
	switch ([[self TileV] Passability])
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

- (void)addTapGestureToTile
{
	[self setTapRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tileTapGesture:)]];
	[[self TapRecognizer] setNumberOfTapsRequired:1];
	[[self TapRecognizer] setNumberOfTouchesRequired:1];
	[[self TileV] addGestureRecognizer:[self TapRecognizer]];
	[[self TapRecognizer] setDelegate:self];
}

- (void)removeTapGestureFromTile
{
	[[self TileV] removeGestureRecognizer:[self TapRecognizer]];
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
