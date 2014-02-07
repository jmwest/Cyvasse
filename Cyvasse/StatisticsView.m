//
//  StatisticsView.m
//  Cyvasse
//
//  Created by John West on 2/6/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "StatisticsView.h"

@implementation StatisticsView

@synthesize PictureView = _PictureView;
@synthesize NameView = _NameView;
@synthesize HealthView = _HealthView;
@synthesize HealthValueView = _HealthValueView;
@synthesize HealthBar = _HealthBar;
@synthesize HealthBarBackground = _HealthBarBackground;
@synthesize AttackView = _AttackView;
@synthesize AttackValueView = _AttackValueView;
@synthesize DefenseView	= _DefenseView;
@synthesize DefenseValueView = _DefenseValueView;
@synthesize MovementView = _MovementView;
@synthesize MovementValueView = _MovementValueView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setBackgroundColor:[UIColor grayColor]];
    }
    return self;
}

@end
