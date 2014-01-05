//
//  PieceViewController.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PieceView.h"
#import "Piece.h"

@interface PieceViewController : UIViewController

- (id)initWithImage:(NSString *)imageName Piece:(Piece *)piece Column:(int)column Row:(int)row AndColor:(UIColor *)color;

- (void)setHealthBarColor:(UIColor *)color;
- (void)setHealthBarLength:(float)currentHealth :(float)maxHealth;

@property (strong, nonatomic) PieceView *PieceV;
@property (strong, nonatomic) Piece *piece;

@end
