//
//  Heavy Horse.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Heavy Horse.h"

@implementation Heavy_Horse

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setName:@"Heavy Horse"];
		[self setHealth:6];
		[self setMaxHealth:6];
		[self setAttack:2];
		[self setAttackRange:1];
		[self setAttackWidth:1];
		[self setDefense:3];
		[self setMovementLength:2];
		[self setCapability:Ahorse];
	}
	return self;
}

@end
