//
//  Map.m
//  Cyvasse
//
//  Created by John West on 3/24/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Map.h"

@interface Map ()

@property (strong, nonatomic) NSMutableArray *mapArray;

@end

@implementation Map

- (id)init
{
	self = [super init];

	if (self)
	{
		for (int i = 0; i < 10; i++)
		{

		}
	}

	return self;
}

- (int)getValueAtColumn:(int)column AndRow:(int)row
{
	NSMutableArray *array = [[NSMutableArray alloc] init];
	NSNumber *number = [NSNumber numberWithInt:1];
	[array addObject:number];

	
	
}

- (int)setValueAtColumn:(int)column AndRow:(int)row
{
	
}

@end
