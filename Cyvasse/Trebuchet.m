//
//  Trebuchet.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Trebuchet.h"

@implementation Trebuchet

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setHealth:2];
		[self setMaxHealth:2];
		[self setAttack:3];
		[self setAttackRange:3];
		[self setAttackWidth:1];
		[self setDefense:1];
		[self setMovementLength:1];
		[self setCapability:Carted];
	}
	return self;
}

@end
