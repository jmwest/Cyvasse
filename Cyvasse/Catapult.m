//
//  Catapult.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Catapult.h"

@implementation Catapult

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setName:@"Catapult"];
		[self setHealth:2];
		[self setMaxHealth:2];
		[self setAttack:2];
		[self setAttackRange:2];
		[self setAttackWidth:3];
		[self setDefense:1];
		[self setMovementLength:2];
		[self setCapability:Wheeled];
	}
	return self;
}

@end
