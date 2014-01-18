//
//  TileViewController.m
//  Cyvasse
//
//  Created by John West on 1/4/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "TileViewController.h"
#import "GlobalConstants.h"

@interface TileViewController ()

- (TileImageView *)TileIV;

@property (strong, nonatomic) UIColor *MovementColor;
@property (strong, nonatomic) UIColor *AttackColor;

@property (strong, nonatomic) UIImage *PlainsImage;
@property (strong, nonatomic) UIImage *MountainImage;
@property (strong, nonatomic) UIImage *RiverImage;

@end

@implementation TileViewController

@synthesize TileIV = _TileIV;
@synthesize TapRecognizer;

@synthesize MovementColor = _MovementColor;
@synthesize AttackColor = _AttackColor;
@synthesize PlainsImage = _PlainsImage;
@synthesize MountainImage = _MountainImage;
@synthesize RiverImage = _RiverImage;

#pragma mark - Init

#pragma mark Columns and Rows must be 0 - 9, inclusive
- (id)initWithColumn:(int)column AndRow:(int)row
{
	CGRect rect = CGRectMake(FIRST_COLUMN_X + (column * TILE_SIZE),
							 FIRST_COLUMN_Y + (row * TILE_SIZE),
							 TILE_SIZE,
							 TILE_SIZE);

	self = [self initWithFrame:rect];

	[[self TileIV] setColumn:column];
	[[self TileIV] setRow:row];

	return self;
}

- (id)initWithFrame:(CGRect)rect
{
	self = [super init];
	if (self)
	{
		[self setTileIV:[[TileImageView alloc] initWithFrame:rect]];
		[self setView:[self TileIV]];

		[self setMovementColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f]];
//		[self setMovementColor:[UIColor colorWithRed:0.98f green:0.98f blue:0.6f alpha:0.4f]];
//		[self setMovementColor:[UIColor colorWithRed:0.69f green:0.769f blue:0.8706f alpha:0.3f]];
		[self setAttackColor:[UIColor colorWithRed:0.94f green:0.5f blue:0.5f alpha:0.3f]];

		[self setPlainsImage:[UIImage imageNamed:@"Plains"]];
		[self setMountainImage:[UIImage imageNamed:@"Mountain"]];
		[self setRiverImage:[UIImage imageNamed:@"River"]];

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
	[[self delegate] TileSelectedToChangeTerrain:[[CoordinateModel alloc] initWithColumn:[[self TileIV] Column] AndRow:[[self TileIV] Row]]];

//	switch ([[self TileIV] Passability])
//	{
//		case Plains:
//			[self setTilePassability:Mountain];
//			break;
//
//		case Mountain:
//			[self setTilePassability:River];
//			break;
//
//		case River:
//			[self setTilePassability:Plains];
//			break;
//
//		default:
//			break;
//	}
}

- (void)tileTapGestureWhenMoving
{
	CoordinateModel *coord = [[CoordinateModel alloc] initWithColumn:[[self TileIV] Column] AndRow:[[self TileIV] Row]];
	[[self delegate] TileHasBeenSelectedAt:coord];
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
			[[self TileIV] setImage:[self PlainsImage]];
			break;

		case Mountain:
			[[self TileIV] setImage:[self MountainImage]];
			break;

		case River:
			[[self TileIV] setImage:[self RiverImage]];
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
		{
			[[[self TileIV] ColorOverlay] setBackgroundColor:[self MovementColor]];

			CGSize size = [[[self TileIV] ColorOverlay] bounds].size;

			CAGradientLayer *gradient = [CAGradientLayer layer];
			[gradient setFrame:[[[self TileIV] ColorOverlay] bounds]];
			[gradient setColors:[[NSArray alloc] initWithObjects:[UIColor whiteColor], [self MovementColor], nil]];
			[gradient setStartPoint:CGPointMake(0.0f, size.height)];
			[gradient setEndPoint:CGPointMake(size.width, 0.0f)];

			[[[[self TileIV] ColorOverlay] layer] insertSublayer:gradient atIndex:0];
		}
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
