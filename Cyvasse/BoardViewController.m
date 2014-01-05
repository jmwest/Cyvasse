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

@interface BoardViewController ()

@end

@implementation BoardViewController

@synthesize Tiles = _Tiles;
@synthesize BoardV = _BoardV;

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
			[[[self Tiles] objectAtIndex:i] addObject:TVC];

			[self addChildViewController:TVC];
			[[self view] addSubview:[TVC TileV]];
		}
	}

	Dragon *dragon = [[Dragon alloc] init];
	PieceViewController *dragonController = [[PieceViewController alloc] initWithImage:@"BlackDragon" Piece:dragon Column:9 Row:9 AndColor:[UIColor blueColor]];

	[self addChildViewController:dragonController];
	[[self BoardV] addSubview:[dragonController PieceV]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
