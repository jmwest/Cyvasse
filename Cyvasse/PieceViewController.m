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

- (id)initWithImage:(NSString *)imageName Frame:(CGRect)frame AndColor:(UIColor *)color
{
	self = [super init];
	if (self)
	{
		[self setPView:[[PieceView alloc] initWithFrame:frame]];
		[self setView:[self PView]];
		[self setPieceHealthVC:[[PieceHealthViewController alloc] initWithFrame:frame AndColor:color]];

		UIImage *image = [UIImage imageNamed:imageName];
		[[[self PView] PieceImage] setImage:image];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	[[self PView] addSubview:[[self PView] PieceImage]];
	[[self PView] addSubview:[[self PieceHealthVC] PHView]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
