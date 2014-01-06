//
//  Elephant.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Elephant.h"

@implementation Elephant

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setHealth:7];
		[self setMaxHealth:7];
		[self setAttack:3];
		[self setAttackRange:1];
		[self setAttackWidth:1];
		[self setDefense:2];
		[self setMovementLength:3];
		[self setCapability:Ahorse];
	}
	return self;
}

@end
