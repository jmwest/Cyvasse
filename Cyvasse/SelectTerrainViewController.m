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

@end

@implementation SelectTerrainViewController

@synthesize SelectTerrainV = _SelectTerrainV;

- (void)viewDidLoad
{
    [super viewDidLoad];

	CGRect mainscreen = [[UIScreen mainScreen] bounds];
	float view_y = ((mainscreen.size.height - BOARD_HEIGHT - STATUS_BAR_HEIGHT - SELECT_TERRAIN_HEIGHT) / 2) + (BOARD_HEIGHT + STATUS_BAR_HEIGHT);

	[self setSelectTerrainV:[[SelectTerrainView alloc] initWithFrame:CGRectMake(LEFT_SIDE_X, view_y, mainscreen.size.width, SELECT_TERRAIN_HEIGHT)]];

	[self setView:[self SelectTerrainV]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
