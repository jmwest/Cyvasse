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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setPieceImage:[[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
																		  0.0f,
																		  frame.size.width,
																		  frame.size.height - 2.0f)]];
    }
    return self;
}

@end
