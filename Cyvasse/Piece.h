//
//  Piece.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	Default,
	Airborne,
	OnFoot,
	Ahorse,
	Wheeled,
	Carted
} MovementCapability;

@interface Piece : NSObject

@property (assign, nonatomic) int Health;
@property (assign, nonatomic) int MaxHealth;
@property (assign, nonatomic) int Attack;
@property (assign, nonatomic) int AttackRange;
@property (assign, nonatomic) int AttackWidth;
@property (assign, nonatomic) int Defense;
@property (assign, nonatomic) int MovementLength;
@property (assign, nonatomic) MovementCapability Capability;

@end
