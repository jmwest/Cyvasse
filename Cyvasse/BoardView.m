//
//  BoardView.m
//  Cyvasse
//
//  Created by John West on 1/4/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "BoardView.h"
#import "TileView.h"
#import "GlobalConstants.h"

@implementation BoardView

@synthesize Background = _Background;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		[self setBackground:[[UIView alloc] initWithFrame:CGRectMake(LEFT_SIDE_X,
																	 STATUS_BAR_HEIGHT,
																	 SCREEN_WIDTH,
																	 BOARD_HEIGHT)]];

		[[self Background] setBackgroundColor:[UIColor blackColor]];
		[self addSubview:[self Background]];

		[self setBackgroundColor:[UIColor lightGrayColor]];
    }
    return self;
}

@end
