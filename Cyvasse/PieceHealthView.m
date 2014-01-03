//
//  PieceHealthView.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "PieceHealthView.h"

@implementation PieceHealthView

@synthesize HealthBar = _HealthBar;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0.0f,
										   frame.size.height - 2.0f,
										   frame.size.width,
										   2.0f)];
    if (self) {
        [self setHealthBar:[[UIView alloc] initWithFrame:CGRectMake(0.0f,
																	0.0f,
																	frame.size.width,
																	2.0f)]];
    }
    return self;
}

@end
