//
//  PieceViewController.h
//  Cyvasse
//
//  Created by John West on 1/3/14.
//  Copyright (c) 2014 John West. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PieceView.h"
#import "TileViewController.h"
#import "PieceImportHeader.h"
#import "CoordinateModel.h"

@protocol PieceDelegate <NSObject>

- (void)AllowPieceToBe:(Highlight)highlight WithCoordinate:(CoordinateModel *)coordinate AndPieceViewController:(id)pieceVC;

@end

@interface PieceViewController : UIViewController <UIGestureRecognizerDelegate>

- (id)initWithImage:(NSString *)imageName Piece:(Piece *)piece Column:(int)column Row:(int)row AndColor:(UIColor *)color;

- (void)setUserInteraction:(BOOL)interaction;

- (void)setHealthBarColor:(UIColor *)color;
- (void)setHealthBarLength:(float)currentHealth :(float)maxHealth;

- (void)bringUpMovementBlocks;
- (void)bringUpAttackBlocks;

- (void)movePieceAlongPath:(NSMutableArray *)path;

@property (strong, nonatomic) PieceView *PieceV;
@property (strong, nonatomic) Piece *piece;
@property (strong, nonatomic) UITapGestureRecognizer *TapGesture;

@property (weak, nonatomic) id <PieceDelegate> delegate;

@end
