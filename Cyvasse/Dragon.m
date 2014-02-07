//
//  Dragon.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Dragon.h"

@implementation Dragon

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setName:@"Dragon"];
		[self setHealth:6];
		[self setMaxHealth:6];
		[self setAttack:4];
		[self setAttackRange:1];
		[self setAttackWidth:1];
		[self setDefense:2];
		[self setMovementLength:3];
		[self setCapability:Airborne];
	}
	return self;
}

@end
