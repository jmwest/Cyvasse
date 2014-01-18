//
//  SelectTerrainViewController.m
//  Cyvasse
//
//  Created by John West on 1/13/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "SelectTerrainViewController.h"
#import "GlobalConstants.h"

@interface SelectTerrainViewController ()

- (void)setTapGestures;

- (void)MountainSelected;
- (void)RiverSelected;
- (void)PlainSelected;

@end

@implementation SelectTerrainViewController

@synthesize SelectTerrainV = _SelectTerrainV;
@synthesize Coordinate = _Coordinate;

@synthesize MountainRecognizer = _MountainRecognizer;
@synthesize RiverRecognizer = _RiverRecognizer;
@synthesize PlainRecognizer = _PlainRecognizer;

- (id)initWithCoordinate:(CoordinateModel *)coordinate
{
	self = [super init];
	if (self) {
		[self setCoordinate:coordinate];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	CGRect mainscreen = [[UIScreen mainScreen] bounds];
	float view_y = ((mainscreen.size.height - BOARD_HEIGHT - STATUS_BAR_HEIGHT - SELECT_TERRAIN_HEIGHT) / 2) + (BOARD_HEIGHT + STATUS_BAR_HEIGHT);

	[self setSelectTerrainV:[[SelectTerrainView alloc] initWithFrame:CGRectMake(LEFT_SIDE_X, view_y, mainscreen.size.width, SELECT_TERRAIN_HEIGHT)]];

	[self setTapGestures];

	CALayer *layer = [[self SelectTerrainV] layer];
    [layer setShadowOffset:CGSizeMake(1, 1)];
    [layer setShadowColor:[[UIColor blackColor] CGColor]];
    [layer setShadowRadius:8.0f];
    [layer setShadowOpacity:1.0f];
	[layer setShadowPath:[[UIBezierPath bezierPathWithRect:[layer bounds]] CGPath]];

	[self setView:[self SelectTerrainV]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTapGestures
{
	[[[self SelectTerrainV] MountainView] setUserInteractionEnabled:YES];
	[[[self SelectTerrainV] RiverView] setUserInteractionEnabled:YES];
	[[[self SelectTerrainV] PlainView] setUserInteractionEnabled:YES];

	[self setMountainRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(MountainSelected)]];
	[self setRiverRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(RiverSelected)]];
	[self setPlainRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PlainSelected)]];

	[[[self SelectTerrainV] MountainView] addGestureRecognizer:[self MountainRecognizer]];
	[[[self SelectTerrainV] RiverView] addGestureRecognizer:[self RiverRecognizer]];
	[[[self SelectTerrainV] PlainView] addGestureRecognizer:[self PlainRecognizer]];
}

- (void)MountainSelected
{
	[[self delegate] ReturnSelectedTerrain:Mountain :[self Coordinate]];
}

- (void)RiverSelected
{
	[[self delegate] ReturnSelectedTerrain:River :[self Coordinate]];
}

- (void)PlainSelected
{
	[[self delegate] ReturnSelectedTerrain:Plains :[self Coordinate]];

}

@end
