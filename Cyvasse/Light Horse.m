//
//  Light Horse.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Light Horse.h"

@implementation Light_Horse

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setName:@"Light Horse"];
		[self setHealth:4];
		[self setMaxHealth:4];
		[self setAttack:3];
		[self setAttackRange:1];
		[self setAttackWidth:1];
		[self setDefense:1];
		[self setMovementLength:3];
		[self setCapability:Ahorse];
	}
	return self;
}

@end
