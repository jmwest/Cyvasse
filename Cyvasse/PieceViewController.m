//
//  PieceViewController.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "PieceViewController.h"
#import "GlobalConstants.h"

@interface PieceViewController ()

@end

@implementation PieceViewController

@synthesize PieceV = _PieceV;
@synthesize piece = _piece;
@synthesize TapGesture = _TapGesture;

- (id)initWithImage:(NSString *)imageName Piece:(Piece *)piece Column:(int)column Row:(int)row AndColor:(UIColor *)color
{
	self = [super init];
	if (self)
	{
		CGRect frame = CGRectMake(FIRST_COLUMN_X + (column * TILE_SIZE),
								  FIRST_COLUMN_Y + (row * TILE_SIZE),
								  TILE_SIZE,
								  TILE_SIZE);

		[self setPieceV:[[PieceView alloc] initWithFrame:frame Image:imageName Column:column Row:row AndHealthColor:color]];

		[self setPiece:piece];

		[self setTapGesture:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bringUpMovementBlocks)]];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self setView:[self PieceV]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)setHealthBarColor:(UIColor *)color
{
	[[[self PieceV] PieceHealthBar] setBackgroundColor:color];
}

- (void)setHealthBarLength:(float)currentHealth :(float)maxHealth
{
	float newWidth;
	
	newWidth = ( currentHealth / maxHealth ) * [[[self PieceV] PieceHealthBar] frame].size.width;

	[[[self PieceV] PieceHealthBar] removeFromSuperview];
	[[[self PieceV] PieceHealthBar] setFrame:CGRectMake([[[self PieceV] PieceHealthBar] frame].origin.x,
												   [[[self PieceV] PieceHealthBar] frame].origin.y,
												   newWidth,
												   [[[self PieceV] PieceHealthBar] frame].size.height)];
	[[self PieceV] addSubview:[[self PieceV] PieceHealthBar]];
}

#pragma mark -

- (void)bringUpMovementBlocks
{
	CoordinateModel *CM = [[CoordinateModel alloc] initWithColumn:[[self PieceV] column] AndRow:[[self PieceV] row]];
	[[self moveDelegate] AllowPieceToBeMoved:CM];
}

- (void)bringUpAttackBlocks
{
	
}

@end
