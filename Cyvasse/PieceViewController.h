//
//  PieceViewController.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "PieceView.h"
#include "Piece.h"

@interface PieceViewController : UIViewController

- (id)initWithImage:(NSString *)imageName Piece:(Piece *)piece Frame:(CGRect)frame AndColor:(UIColor *)color;

- (void)setHealthBarColor:(UIColor *)color;
- (void)setHealthBarLength:(int)currentHealth :(int)maxHealth;

@property (strong, nonatomic) PieceView *PView;
@property (strong, nonatomic) Piece *piece;

@end
