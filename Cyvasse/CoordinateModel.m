//
//  CoordinateModel.m
//  Cyvasse
//
//  Created by John West on 1/5/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "CoordinateModel.h"

@implementation CoordinateModel

- (id)initWithColumn:(int)column AndRow:(int)row
{
	if (self)
	{
		if (column)
		{
			[self setCoordColumn:column];
		}
		if (row)
		{
			[self setCoordRow:row];
		}
	}
	return self;
}

@end
