//
//  SelectTerrainView.m
//  Cyvasse
//
//  Created by John West on 1/13/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "SelectTerrainView.h"
#import "GlobalConstants.h"

@implementation SelectTerrainView

@synthesize MountainView = _MountainView;
@synthesize RiverView = _RiverView;
@synthesize PlainView = _PlainView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setBackgroundColor:[UIColor darkGrayColor]];

		[self setMountainView:[[UIImageView alloc] initWithFrame:CGRectMake(SELECT_TERRAIN_PICTURE_X1, SELECT_TERRAIN_PICTURE_Y, SELECT_TERRAIN_PICTURE_WIDTH, SELECT_TERRAIN_PICTURE_HEIGHT)]];
		[self setRiverView:[[UIImageView alloc] initWithFrame:CGRectMake(SELECT_TERRAIN_PICTURE_X2, SELECT_TERRAIN_PICTURE_Y, SELECT_TERRAIN_PICTURE_WIDTH, SELECT_TERRAIN_PICTURE_HEIGHT)]];
		[self setPlainView:[[UIImageView alloc] initWithFrame:CGRectMake(SELECT_TERRAIN_PICTURE_X3, SELECT_TERRAIN_PICTURE_Y, SELECT_TERRAIN_PICTURE_WIDTH, SELECT_TERRAIN_PICTURE_HEIGHT)]];

		[[self MountainView] setImage:[UIImage imageNamed:@"Mountain"]];
		[[self RiverView] setImage:[UIImage imageNamed:@"River"]];
		[[self PlainView] setImage:[UIImage imageNamed:@"Plains"]];

		[self addSubview:[self MountainView]];
		[self addSubview:[self RiverView]];
		[self addSubview:[self PlainView]];
    }
    return self;
}

@end
