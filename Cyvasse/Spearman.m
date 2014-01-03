//
//  Spearman.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Spearman.h"

@implementation Spearman

- (id)init
{
	self = [super init];
	if (self)
	{
		[self setHealth:2];
		[self setMaxHealth:2];
		[self setAttack:2];
		[self setAttackRange:1];
		[self setAttackWidth:1];
		[self setDefense:2];
		[self setMovementLength:1];
		[self setCapability:OnFoot];
	}
	return self;
}

@end
