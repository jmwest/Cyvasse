//
//  PieceViewController.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "PieceViewController.h"

@interface PieceViewController ()

@end

@implementation PieceViewController

@synthesize PView = _PView;
@synthesize piece = _piece;

- (id)initWithImage:(NSString *)imageName Piece:(Piece *)piece Frame:(CGRect)frame AndColor:(UIColor *)color
{
	self = [super init];
	if (self)
	{
		[self setPView:[[PieceView alloc] initWithFrame:frame Image:imageName AndHealthColor:color]];

		[self setPiece:piece];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self setView:[self PView]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setHealthBarColor:(UIColor *)color
{
	[[[self PView] PieceHealthBar] setBackgroundColor:color];
}

- (void)setHealthBarLength:(int)currentHealth :(int)maxHealth
{
	double newWidth;
	
	newWidth = ( currentHealth / maxHealth ) * [[self PView] frame].size.width;
	
	[[[self PView] PieceHealthBar] setFrame:CGRectMake([[[self PView] PieceHealthBar] frame].origin.x,
												   [[[self PView] PieceHealthBar] frame].origin.y,
												   newWidth,
												   [[[self PView] PieceHealthBar] frame].size.height)];
}

@end
