//
//  Piece.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "Piece.h"

@implementation Piece

@synthesize Health = _Health;
@synthesize MaxHealth = _MaxHealth;
@synthesize Attack = _Attack;
@synthesize AttackRange = _AttackRange;
@synthesize AttackWidth = _AttackWidth;
@synthesize Defense = _Defense;
@synthesize MovementLength = _MovementLength;
@synthesize Capability = _Capability;

- (id)init
{
	self = [super init];
	if (self)
	{
		_Health = 0;
		_MaxHealth = 0;
		_Attack = 0;
		_AttackRange = 0;
		_AttackWidth = 0;
		_Defense = 0;
		_MovementLength = 0;
		_Capability = DefaultMC;
	}
	return self;
}

@end
