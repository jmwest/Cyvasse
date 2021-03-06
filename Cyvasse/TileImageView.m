//
//  TileView.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "TileImageView.h"

@implementation TileImageView

@synthesize Passability = _Passability;
@synthesize Occupied = _Occupied;
@synthesize ColorOverlay = _ColorOverlay;
@synthesize tileColumn = _tileColumn;
@synthesize tileRow = _tileRow;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setUserInteractionEnabled:YES];
        [self setPassability:DefaultT];
		[self setOccupied:DefaultTO];
		[self setColorOverlay:[[UIView alloc] initWithFrame:CGRectMake(0.0f,
																	   0.0f,
																	   frame.size.width,
																	   frame.size.height)]];
		[self setTileColumn:0];
		[self setTileRow:0];

		[[self ColorOverlay] setBackgroundColor:[UIColor clearColor]];

		[self addSubview:[self ColorOverlay]];
    }
    return self;
}

@end
