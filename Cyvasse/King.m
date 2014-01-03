//
//  King.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "King.h"

@implementation King

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setHealth:1];
		[self setMaxHealth:1];
		[self setAttack:2];
		[self setAttackRange:1];
		[self setAttackWidth:1];
		[self setDefense:1];
		[self setMovementLength:1];
		[self setCapability:OnFoot];
	}
	return self;
}

@end
