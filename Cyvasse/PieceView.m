//
//  PieceView.m
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import "PieceView.h"

@implementation PieceView

@synthesize PieceImage = _PieceImage;
@synthesize PieceHealthBar = _PieceHealthBar;
@synthesize PieceHealthBackground = _PieceHealthBackground;

@synthesize pieceColumn = _pieceColumn;
@synthesize pieceRow = _pieceRow;

- (id)initWithFrame:(CGRect)frame Image:(NSString *)string Column:(int)column Row:(int)row AndHealthColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setUserInteractionEnabled:YES];
        [self setPieceImage:[[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
																		  0.0f,
																		  frame.size.width,
																		  frame.size.height - 2.0f)]];
		[self setPieceHealthBar:[[UIView alloc] initWithFrame:CGRectMake(0.0f,
																		 frame.size.height - 2.0f,
																		 frame.size.width,
																		 2.0f)]];
		[self setPieceHealthBackground:[[UIView alloc] initWithFrame:CGRectMake(0.0f,
																		 frame.size.height - 2.0f,
																		 frame.size.width,
																		 2.0f)]];

		[self setBackgroundColor:[UIColor clearColor]];

		UIImage *image = [UIImage imageNamed:string];
		[[self PieceImage] setImage:image];

		[self setPieceColumn:column];
		[self setPieceRow:row];

		[[self PieceHealthBar] setBackgroundColor:color];
		[[self PieceHealthBackground] setBackgroundColor:[UIColor blackColor]];

		[self addSubview:[self PieceImage]];
		[self addSubview:[self PieceHealthBackground]];
		[self addSubview:[self PieceHealthBar]];
    }
    return self;
}

@end
