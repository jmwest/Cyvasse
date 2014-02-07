//
//  Crossbowman.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Crossbowman.h"

@implementation Crossbowman

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setName:@"Crossbowman"];
		[self setHealth:2];
		[self setMaxHealth:2];
		[self setAttack:2];
		[self setAttackRange:2];
		[self setAttackWidth:3];
		[self setDefense:1];
		[self setMovementLength:1];
		[self setCapability:OnFoot];
	}
	return self;
}

@end
