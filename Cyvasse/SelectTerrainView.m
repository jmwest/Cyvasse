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
		[self setMountainView:[[UIImageView alloc] initWithFrame:frame]];
    }
    return self;
}

@end
