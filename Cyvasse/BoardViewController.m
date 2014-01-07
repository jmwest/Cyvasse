//
//  BoardViewController.m
//  Cyvasse
//
//  Created by John West on 1/4/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "BoardViewController.h"
#import "TileViewController.h"
#import "PieceImportHeader.h"
#import "PieceViewController.h"
#import "CoordinateModel.h"

@interface BoardViewController ()

- (NSMutableArray *)RecursivelyAddTilesAndReturnArray:(NSMutableArray *)tileArray Coord:(CoordinateModel *)coordinate Piece:(Piece *)piece MovesLeft:(int)movesLeft;

- (void)RemoveTapGesturesFromTiles:(NSMutableArray *)tileArray;
- (void)AddTapGestureWithTarget:(SEL)selector ToTiles:(NSMutableArray *)tileArray;

- (CoordinateModel *)getLeftCoord:(CoordinateModel *)coordinate;
- (CoordinateModel *)getRightCoord:(CoordinateModel *)coordinate;
- (CoordinateModel *)getUpCoord:(CoordinateModel *)coordinate;
- (CoordinateModel *)getDownCoord:(CoordinateModel *)coordinate;

- (void)combineArray:(NSMutableArray *)arrayOne WithArray:(NSMutableArray *)arrayTwo;
- (void)highlightTiles:(Highlight)highlight InArray:(NSMutableArray *)array;

- (BOOL)checkCoordCanGoLeft:(CoordinateModel *)coordinate;
- (BOOL)checkCoordCanGoRight:(CoordinateModel *)coordinate;
- (BOOL)checkCoordCanGoUp:(CoordinateModel *)coordinate;
- (BOOL)checkCoordCanGoDown:(CoordinateModel *)coordinate;
- (BOOL)checkCoord:(CoordinateModel *)coordinate CanBeTraversed:(Piece *)piece WithMovesLeft:(int)moves;
- (BOOL)checkArray:(NSArray *)array DoesNotContainCoord:(CoordinateModel *)coord;

- (int)calculateMovementCostToCoord:(CoordinateModel *)coordinate WithPiece:(Piece *)piece;

- (BOOL)coordCompare:(CoordinateModel *)op1 :(CoordinateModel *)op2;

@property (strong, nonatomic) NSMutableArray *MoveableCoords;
@property (strong, nonatomic) PieceViewController *MoveablePiece;

@end

@implementation BoardViewController

@synthesize Tiles = _Tiles;
@synthesize BoardV = _BoardV;

@synthesize MoveableCoords = _MoveableCoords;
@synthesize MoveablePiece = _MoveablePiece;

- (void)viewDidLoad
{
    [super viewDidLoad];

	CGRect mainscreen = [[UIScreen mainScreen] bounds];

	[self setTiles:[[NSMutableArray alloc] init]];
	[self setBoardV:[[BoardView alloc] initWithFrame:CGRectMake(mainscreen.origin.x,
																mainscreen.origin.y,
																mainscreen.size.width,
																mainscreen.size.height)]];
	[self setView:[self BoardV]];

	for (int i = 0; i < 10; i++)
	{
		[[self Tiles] addObject:[[NSMutableArray alloc] init]];
		
		for (int j = 0; j < 10; j++)
		{
			TileViewController *TVC = [[TileViewController alloc] initWithColumn:i AndRow:j];
			[TVC setTilePassability:Plains];
			[TVC setDelegate:self];
			[[[self Tiles] objectAtIndex:i] addObject:TVC];

			[self addChildViewController:TVC];
			[[self view] addSubview:[TVC TileIV]];
		}
	}

	Dragon *dragon = [[Dragon alloc] init];
	PieceViewController *dragonController = [[PieceViewController alloc] initWithImage:@"BlackDragon" Piece:dragon Column:9 Row:9 AndColor:[UIColor blueColor]];

	Elephant *elephant = [[Elephant alloc] init];
	PieceViewController *elephantController = [[PieceViewController alloc] initWithImage:@"RedElephant" Piece:elephant Column:2 Row:7 AndColor:[UIColor redColor]];

	[self addChildViewController:dragonController];
	[[self BoardV] addSubview:[dragonController PieceV]];

	[self addChildViewController:elephantController];
	[[self BoardV] addSubview:[elephantController PieceV]];

	[dragonController setDelegate:self];
	[elephantController setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate Methods

- (void)AllowPieceToBe:(Highlight)highlight WithCoordinate:(CoordinateModel *)coordinate AndPieceViewController:(id)pieceVC
{
	Piece *piece = [pieceVC piece];
	int moves = [piece MovementLength];

	NSMutableArray *stack = [[NSMutableArray alloc] init];

	CoordinateModel *coord;
	if ([self checkCoordCanGoDown:coordinate])
	{
		coord = [[CoordinateModel alloc] initWithColumn:[coordinate column] AndRow:([coordinate row] + 1)];
		[stack addObject:coord];
	}
	if ([self checkCoordCanGoUp:coordinate])
	{
		coord = [[CoordinateModel alloc] initWithColumn:[coordinate column] AndRow:([coordinate row] - 1)];
		[stack addObject:coord];
	}
	if ([self checkCoordCanGoLeft:coordinate])
	{
		coord = [[CoordinateModel alloc] initWithColumn:([coordinate column] - 1) AndRow:[coordinate row]];
		[stack addObject:coord];
	}
	if ([self checkCoordCanGoRight:coordinate])
	{
		coord = [[CoordinateModel alloc] initWithColumn:([coordinate column] + 1) AndRow:[coordinate row]];
		[stack addObject:coord];
	}

	NSMutableArray *acquisitions = [[NSMutableArray alloc] initWithObjects:coordinate, nil];
	NSMutableArray *temp;

	for (int i = 0; i < [stack count]; i++)
	{
		temp = [self RecursivelyAddTilesAndReturnArray:[self Tiles] Coord:[stack objectAtIndex:i] Piece:piece MovesLeft:moves];

		[acquisitions addObjectsFromArray:temp];
	}

	[self setMoveableCoords:acquisitions];
	[self setMoveablePiece:pieceVC];

	[self highlightTiles:highlight InArray:[self MoveableCoords]];

	[self RemoveTapGesturesFromTiles:[self Tiles]];
	[self AddTapGestureWithTarget:@selector(tileTapGestureWhenMoving) ToTiles:[self Tiles]];
}

- (void)TileHasBeenSelectedAt:(CoordinateModel *)coordinate
{
	if (![self checkArray:[self MoveableCoords] DoesNotContainCoord:coordinate])
	{
		NSMutableArray *path = [[NSMutableArray alloc] initWithObjects:coordinate, nil];
		[[self MoveablePiece] movePieceAlongPath:path];
	}

	[self highlightTiles:UnHighlighted InArray:[self MoveableCoords]];
	[self RemoveTapGesturesFromTiles:[self Tiles]];
	[self AddTapGestureWithTarget:@selector(tileTapGesture) ToTiles:[self Tiles]];
}

#pragma mark -

- (NSMutableArray *)RecursivelyAddTilesAndReturnArray:(NSMutableArray *)tileArray Coord:(CoordinateModel *)coordinate Piece:(Piece *)piece MovesLeft:(int)movesLeft
{
	NSMutableArray *temp = [[NSMutableArray alloc] init];
	NSMutableArray *tempR = [[NSMutableArray alloc] init];
	NSMutableArray *tempL = [[NSMutableArray alloc] init];
	NSMutableArray *tempD = [[NSMutableArray alloc] init];
	NSMutableArray *tempU = [[NSMutableArray alloc] init];

	if ([self checkCoord:coordinate CanBeTraversed:piece WithMovesLeft:movesLeft])
	{
		[temp addObject:coordinate];

		if ([self checkCoordCanGoRight:coordinate])
		{
			tempR = [self RecursivelyAddTilesAndReturnArray:tileArray Coord:[self getRightCoord:coordinate] Piece:piece MovesLeft:(movesLeft - [self calculateMovementCostToCoord:coordinate WithPiece:piece])];
		}
		if ([self checkCoordCanGoLeft:coordinate])
		{
			tempL = [self RecursivelyAddTilesAndReturnArray:tileArray Coord:[self getLeftCoord:coordinate] Piece:piece MovesLeft:(movesLeft - [self calculateMovementCostToCoord:coordinate WithPiece:piece])];
		}
		if ([self checkCoordCanGoDown:coordinate])
		{
			tempD = [self RecursivelyAddTilesAndReturnArray:tileArray Coord:[self getDownCoord:coordinate] Piece:piece MovesLeft:(movesLeft - [self calculateMovementCostToCoord:coordinate WithPiece:piece])];
		}
		if ([self checkCoordCanGoUp:coordinate])
		{
			tempU = [self RecursivelyAddTilesAndReturnArray:tileArray Coord:[self getUpCoord:coordinate] Piece:piece MovesLeft:(movesLeft - [self calculateMovementCostToCoord:coordinate WithPiece:piece])];
		}
	}

	[self combineArray:temp WithArray:tempR];
	[self combineArray:temp WithArray:tempL];
	[self combineArray:temp WithArray:tempD];
	[self combineArray:temp WithArray:tempU];

	return temp;
}

- (void)RemoveTapGesturesFromTiles:(NSMutableArray *)tileArray
{
	for (int i = 0; i < [tileArray count]; i++)
	{
		for (int j = 0; j < [[tileArray objectAtIndex:i] count]; j++)
		{
			TileViewController *temp = [[tileArray objectAtIndex:i] objectAtIndex:j];
			[temp removeTapGestureFromTile:[temp TapRecognizer]];
		}
	}
}

- (void)AddTapGestureWithTarget:(SEL)selector ToTiles:(NSMutableArray *)tileArray
{
	for (int i = 0; i < [tileArray count]; i++)
	{
		for (int j = 0; j < [[tileArray objectAtIndex:i] count]; j++)
		{
			TileViewController *temp = [[tileArray objectAtIndex:i] objectAtIndex:j];

			UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:temp action:selector];

			[temp addTapGestureToTile:gesture];
		}
	}
}

- (CoordinateModel *)getLeftCoord:(CoordinateModel *)coordinate
{
	return [[CoordinateModel alloc] initWithColumn:([coordinate column] - 1) AndRow:[coordinate row]];
}

- (CoordinateModel *)getRightCoord:(CoordinateModel *)coordinate
{
	return [[CoordinateModel alloc] initWithColumn:([coordinate column] + 1) AndRow:[coordinate row]];
}

- (CoordinateModel *)getUpCoord:(CoordinateModel *)coordinate
{
	return [[CoordinateModel alloc] initWithColumn:[coordinate column] AndRow:([coordinate row] - 1)];
}

- (CoordinateModel *)getDownCoord:(CoordinateModel *)coordinate
{
	return [[CoordinateModel alloc] initWithColumn:[coordinate column] AndRow:([coordinate row] + 1)];
}

- (void)combineArray:(NSMutableArray *)arrayOne WithArray:(NSMutableArray *)arrayTwo
{
	for (int i = 0; i < [arrayTwo count]; i++)
	{
		if ([self checkArray:arrayOne DoesNotContainCoord:[arrayTwo objectAtIndex:i]])
		{
			[arrayOne addObject:[arrayTwo objectAtIndex:i]];
		}
	}
}

- (void)highlightTiles:(Highlight)highlight InArray:(NSMutableArray *)array
{
	TileViewController *TVC;
	for (int j = 0; j < [array count]; j++)
	{
		TVC = [[[self Tiles] objectAtIndex:[[array objectAtIndex:j] column]] objectAtIndex:[[array objectAtIndex:j] row]];
		
		[TVC setTileOverlay:highlight];
	}
}

- (BOOL)checkCoordCanGoLeft:(CoordinateModel *)coordinate
{
	if ([coordinate column] > 0)
	{
		return true;
	}
	
	return false;
}

- (BOOL)checkCoordCanGoRight:(CoordinateModel *)coordinate
{
	if ([coordinate column] < 9)
	{
		return true;
	}
	
	return false;
}

- (BOOL)checkCoordCanGoUp:(CoordinateModel *)coordinate
{
	if ([coordinate row] > 0)
	{
		return true;
	}

	return false;
}

- (BOOL)checkCoordCanGoDown:(CoordinateModel *)coordinate
{
	if ([coordinate row] < 9)
	{
		return true;
	}
	
	return false;
}

- (BOOL)checkCoord:(CoordinateModel *)coordinate CanBeTraversed:(Piece *)piece WithMovesLeft:(int)moves
{
	if (moves >= [self calculateMovementCostToCoord:coordinate WithPiece:piece])
	{
		return true;
	}

	return false;
}

- (BOOL)checkArray:(NSArray *)array DoesNotContainCoord:(CoordinateModel *)coord
{
	for (int i = 0; i < [array count]; i++)
	{
		if ([self coordCompare:coord :[array objectAtIndex:i]])
		{
			return false;
		}
	}

	return true;
}

- (int)calculateMovementCostToCoord:(CoordinateModel *)coordinate WithPiece:(Piece *)piece
{
	if ([[[[[self Tiles] objectAtIndex:[coordinate column]] objectAtIndex:[coordinate row]] TileIV] Passability] == Plains)
	{
		return 1;
	}

	if ([piece Capability] == Airborne)
	{
		return 1;
	}
	else if ([piece Capability] == OnFoot)
	{
		return 2;
	}
	else if ([piece Capability] == Ahorse)
	{
		if ([[[[[self Tiles] objectAtIndex:[coordinate column]] objectAtIndex:[coordinate row]] TileIV] Passability] == River)
		{
			return 2;
		}
		else
		{
			return [piece MovementLength] + 1;
		}
	}
	else if ([piece Capability] == Wheeled)
	{
		if ([[[[[self Tiles] objectAtIndex:[coordinate column]] objectAtIndex:[coordinate row]] TileIV] Passability] == River)
		{
			return 2;
		}
		else
		{
			return [piece MovementLength] + 1;
		}
	}
	else
	{
		return [piece MovementLength] + 1;
	}
}

- (BOOL)coordCompare:(CoordinateModel *)op1 :(CoordinateModel *)op2
{
	if (([op1 column] == [op2 column]) && ([op1 row] == [op2 row]))
	{
		return true;
	}

	return false;
}

@end
